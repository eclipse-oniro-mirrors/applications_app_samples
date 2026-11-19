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

export default function DateTimeDateCubePart3Test(): void {
  describe('DateTimeDateCubePart3', () => {

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_8100
     * @tc.name      testDateCube0081
     * @tc.desc      Verify concatDate(2026, 3, 32) pads to 20260332.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0081 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 3, 32)).assertEqual('20260332');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0081 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_8200
     * @tc.name      testDateCube0082
     * @tc.desc      Verify concatDate(2026, 4, 0) pads to 20260400.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0082 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 4, 0)).assertEqual('20260400');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0082 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_8300
     * @tc.name      testDateCube0083
     * @tc.desc      Verify concatDate(2026, 4, 1) pads to 20260401.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0083 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 4, 1)).assertEqual('20260401');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0083 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_8400
     * @tc.name      testDateCube0084
     * @tc.desc      Verify concatDate(2026, 4, 15) pads to 20260415.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0084 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 4, 15)).assertEqual('20260415');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0084 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_8500
     * @tc.name      testDateCube0085
     * @tc.desc      Verify concatDate(2026, 4, 31) pads to 20260431.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0085 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 4, 31)).assertEqual('20260431');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0085 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_8600
     * @tc.name      testDateCube0086
     * @tc.desc      Verify concatDate(2026, 4, 32) pads to 20260432.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0086 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 4, 32)).assertEqual('20260432');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0086 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_8700
     * @tc.name      testDateCube0087
     * @tc.desc      Verify concatDate(2026, 5, 0) pads to 20260500.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0087 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 5, 0)).assertEqual('20260500');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0087 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_8800
     * @tc.name      testDateCube0088
     * @tc.desc      Verify concatDate(2026, 5, 1) pads to 20260501.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0088 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 5, 1)).assertEqual('20260501');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0088 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_8900
     * @tc.name      testDateCube0089
     * @tc.desc      Verify concatDate(2026, 5, 15) pads to 20260515.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0089 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 5, 15)).assertEqual('20260515');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0089 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_9000
     * @tc.name      testDateCube0090
     * @tc.desc      Verify concatDate(2026, 5, 31) pads to 20260531.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0090 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 5, 31)).assertEqual('20260531');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0090 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_9100
     * @tc.name      testDateCube0091
     * @tc.desc      Verify concatDate(2026, 5, 32) pads to 20260532.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0091 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 5, 32)).assertEqual('20260532');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0091 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_9200
     * @tc.name      testDateCube0092
     * @tc.desc      Verify concatDate(2026, 6, 0) pads to 20260600.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0092 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 6, 0)).assertEqual('20260600');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0092 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_9300
     * @tc.name      testDateCube0093
     * @tc.desc      Verify concatDate(2026, 6, 1) pads to 20260601.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0093 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 6, 1)).assertEqual('20260601');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0093 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_9400
     * @tc.name      testDateCube0094
     * @tc.desc      Verify concatDate(2026, 6, 15) pads to 20260615.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0094 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 6, 15)).assertEqual('20260615');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0094 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_9500
     * @tc.name      testDateCube0095
     * @tc.desc      Verify concatDate(2026, 6, 31) pads to 20260631.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0095 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 6, 31)).assertEqual('20260631');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0095 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_9600
     * @tc.name      testDateCube0096
     * @tc.desc      Verify concatDate(2026, 6, 32) pads to 20260632.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0096 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 6, 32)).assertEqual('20260632');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0096 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_9700
     * @tc.name      testDateCube0097
     * @tc.desc      Verify concatDate(2026, 7, 0) pads to 20260700.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0097 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 7, 0)).assertEqual('20260700');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0097 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_9800
     * @tc.name      testDateCube0098
     * @tc.desc      Verify concatDate(2026, 7, 1) pads to 20260701.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0098 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 7, 1)).assertEqual('20260701');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0098 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_9900
     * @tc.name      testDateCube0099
     * @tc.desc      Verify concatDate(2026, 7, 15) pads to 20260715.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0099 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 7, 15)).assertEqual('20260715');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0099 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_10000
     * @tc.name      testDateCube0100
     * @tc.desc      Verify concatDate(2026, 7, 31) pads to 20260731.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0100 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 7, 31)).assertEqual('20260731');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0100 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_10100
     * @tc.name      testDateCube0101
     * @tc.desc      Verify concatDate(2026, 7, 32) pads to 20260732.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0101 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 7, 32)).assertEqual('20260732');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0101 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_10200
     * @tc.name      testDateCube0102
     * @tc.desc      Verify concatDate(2026, 8, 0) pads to 20260800.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0102 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 8, 0)).assertEqual('20260800');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0102 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_10300
     * @tc.name      testDateCube0103
     * @tc.desc      Verify concatDate(2026, 8, 1) pads to 20260801.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0103 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 8, 1)).assertEqual('20260801');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0103 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_10400
     * @tc.name      testDateCube0104
     * @tc.desc      Verify concatDate(2026, 8, 31) pads to 20260831.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0104 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 8, 31)).assertEqual('20260831');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0104 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_10500
     * @tc.name      testDateCube0105
     * @tc.desc      Verify concatDate(2026, 8, 32) pads to 20260832.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0105 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 8, 32)).assertEqual('20260832');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0105 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_10600
     * @tc.name      testDateCube0106
     * @tc.desc      Verify concatDate(2026, 9, 0) pads to 20260900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0106 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 9, 0)).assertEqual('20260900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0106 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_10700
     * @tc.name      testDateCube0107
     * @tc.desc      Verify concatDate(2026, 9, 1) pads to 20260901.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0107 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 9, 1)).assertEqual('20260901');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0107 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_10800
     * @tc.name      testDateCube0108
     * @tc.desc      Verify concatDate(2026, 9, 15) pads to 20260915.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0108 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 9, 15)).assertEqual('20260915');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0108 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_10900
     * @tc.name      testDateCube0109
     * @tc.desc      Verify concatDate(2026, 9, 31) pads to 20260931.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0109 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 9, 31)).assertEqual('20260931');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0109 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_11000
     * @tc.name      testDateCube0110
     * @tc.desc      Verify concatDate(2026, 9, 32) pads to 20260932.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0110 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 9, 32)).assertEqual('20260932');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0110 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_11100
     * @tc.name      testDateCube0111
     * @tc.desc      Verify concatDate(2026, 10, 0) pads to 20261000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0111 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 10, 0)).assertEqual('20261000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0111 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_11200
     * @tc.name      testDateCube0112
     * @tc.desc      Verify concatDate(2026, 10, 1) pads to 20261001.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0112 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 10, 1)).assertEqual('20261001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0112 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_11300
     * @tc.name      testDateCube0113
     * @tc.desc      Verify concatDate(2026, 10, 15) pads to 20261015.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0113 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 10, 15)).assertEqual('20261015');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0113 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_11400
     * @tc.name      testDateCube0114
     * @tc.desc      Verify concatDate(2026, 10, 31) pads to 20261031.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0114 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 10, 31)).assertEqual('20261031');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0114 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_11500
     * @tc.name      testDateCube0115
     * @tc.desc      Verify concatDate(2026, 10, 32) pads to 20261032.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0115 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 10, 32)).assertEqual('20261032');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0115 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_11600
     * @tc.name      testDateCube0116
     * @tc.desc      Verify concatDate(2026, 11, 0) pads to 20261100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0116 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 11, 0)).assertEqual('20261100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0116 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_11700
     * @tc.name      testDateCube0117
     * @tc.desc      Verify concatDate(2026, 11, 1) pads to 20261101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0117 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 11, 1)).assertEqual('20261101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0117 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_11800
     * @tc.name      testDateCube0118
     * @tc.desc      Verify concatDate(2026, 11, 15) pads to 20261115.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0118 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 11, 15)).assertEqual('20261115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0118 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_11900
     * @tc.name      testDateCube0119
     * @tc.desc      Verify concatDate(2026, 11, 31) pads to 20261131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0119 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 11, 31)).assertEqual('20261131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0119 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DCUBP3_12000
     * @tc.name      testDateCube0120
     * @tc.desc      Verify concatDate(2026, 11, 32) pads to 20261132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDateCube0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0120 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 11, 32)).assertEqual('20261132');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateCube0120 end');
    })

  })
}
