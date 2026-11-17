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

export default function DateTimeTimeCubePart3Test(): void {
  describe('DateTimeTimeCubePart3', () => {

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_8100
     * @tc.name      testTimeCube0081
     * @tc.desc      Verify concatTime(9, 0, 59) pads to 090059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0081 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(9, 0, 59)).assertEqual('090059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0081 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_8200
     * @tc.name      testTimeCube0082
     * @tc.desc      Verify concatTime(9, 30, 0) pads to 093000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0082 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(9, 30, 0)).assertEqual('093000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0082 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_8300
     * @tc.name      testTimeCube0083
     * @tc.desc      Verify concatTime(9, 30, 30) pads to 093030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0083 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(9, 30, 30)).assertEqual('093030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0083 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_8400
     * @tc.name      testTimeCube0084
     * @tc.desc      Verify concatTime(9, 30, 59) pads to 093059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0084 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(9, 30, 59)).assertEqual('093059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0084 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_8500
     * @tc.name      testTimeCube0085
     * @tc.desc      Verify concatTime(9, 59, 0) pads to 095900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0085 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(9, 59, 0)).assertEqual('095900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0085 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_8600
     * @tc.name      testTimeCube0086
     * @tc.desc      Verify concatTime(9, 59, 30) pads to 095930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0086 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(9, 59, 30)).assertEqual('095930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0086 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_8700
     * @tc.name      testTimeCube0087
     * @tc.desc      Verify concatTime(9, 59, 59) pads to 095959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0087 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(9, 59, 59)).assertEqual('095959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0087 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_8800
     * @tc.name      testTimeCube0088
     * @tc.desc      Verify concatTime(10, 0, 0) pads to 100000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0088 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(10, 0, 0)).assertEqual('100000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0088 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_8900
     * @tc.name      testTimeCube0089
     * @tc.desc      Verify concatTime(10, 0, 30) pads to 100030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0089 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(10, 0, 30)).assertEqual('100030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0089 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_9000
     * @tc.name      testTimeCube0090
     * @tc.desc      Verify concatTime(10, 0, 59) pads to 100059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0090 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(10, 0, 59)).assertEqual('100059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0090 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_9100
     * @tc.name      testTimeCube0091
     * @tc.desc      Verify concatTime(10, 30, 0) pads to 103000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0091 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(10, 30, 0)).assertEqual('103000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0091 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_9200
     * @tc.name      testTimeCube0092
     * @tc.desc      Verify concatTime(10, 30, 30) pads to 103030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0092 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(10, 30, 30)).assertEqual('103030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0092 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_9300
     * @tc.name      testTimeCube0093
     * @tc.desc      Verify concatTime(10, 30, 59) pads to 103059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0093 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(10, 30, 59)).assertEqual('103059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0093 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_9400
     * @tc.name      testTimeCube0094
     * @tc.desc      Verify concatTime(10, 59, 0) pads to 105900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0094 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(10, 59, 0)).assertEqual('105900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0094 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_9500
     * @tc.name      testTimeCube0095
     * @tc.desc      Verify concatTime(10, 59, 30) pads to 105930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0095 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(10, 59, 30)).assertEqual('105930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0095 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_9600
     * @tc.name      testTimeCube0096
     * @tc.desc      Verify concatTime(10, 59, 59) pads to 105959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0096 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(10, 59, 59)).assertEqual('105959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0096 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_9700
     * @tc.name      testTimeCube0097
     * @tc.desc      Verify concatTime(11, 0, 0) pads to 110000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0097 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(11, 0, 0)).assertEqual('110000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0097 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_9800
     * @tc.name      testTimeCube0098
     * @tc.desc      Verify concatTime(11, 0, 30) pads to 110030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0098 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(11, 0, 30)).assertEqual('110030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0098 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_9900
     * @tc.name      testTimeCube0099
     * @tc.desc      Verify concatTime(11, 0, 59) pads to 110059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0099 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(11, 0, 59)).assertEqual('110059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0099 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_10000
     * @tc.name      testTimeCube0100
     * @tc.desc      Verify concatTime(11, 30, 0) pads to 113000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0100 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(11, 30, 0)).assertEqual('113000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0100 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_10100
     * @tc.name      testTimeCube0101
     * @tc.desc      Verify concatTime(11, 30, 30) pads to 113030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0101 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(11, 30, 30)).assertEqual('113030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0101 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_10200
     * @tc.name      testTimeCube0102
     * @tc.desc      Verify concatTime(11, 30, 59) pads to 113059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0102 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(11, 30, 59)).assertEqual('113059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0102 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_10300
     * @tc.name      testTimeCube0103
     * @tc.desc      Verify concatTime(11, 59, 0) pads to 115900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0103 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(11, 59, 0)).assertEqual('115900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0103 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_10400
     * @tc.name      testTimeCube0104
     * @tc.desc      Verify concatTime(11, 59, 30) pads to 115930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0104 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(11, 59, 30)).assertEqual('115930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0104 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_10500
     * @tc.name      testTimeCube0105
     * @tc.desc      Verify concatTime(11, 59, 59) pads to 115959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0105 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(11, 59, 59)).assertEqual('115959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0105 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_10600
     * @tc.name      testTimeCube0106
     * @tc.desc      Verify concatTime(12, 0, 0) pads to 120000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0106 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(12, 0, 0)).assertEqual('120000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0106 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_10700
     * @tc.name      testTimeCube0107
     * @tc.desc      Verify concatTime(12, 0, 30) pads to 120030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0107 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(12, 0, 30)).assertEqual('120030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0107 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_10800
     * @tc.name      testTimeCube0108
     * @tc.desc      Verify concatTime(12, 0, 59) pads to 120059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0108 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(12, 0, 59)).assertEqual('120059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0108 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_10900
     * @tc.name      testTimeCube0109
     * @tc.desc      Verify concatTime(12, 30, 0) pads to 123000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0109 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(12, 30, 0)).assertEqual('123000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0109 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_11000
     * @tc.name      testTimeCube0110
     * @tc.desc      Verify concatTime(12, 30, 30) pads to 123030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0110 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(12, 30, 30)).assertEqual('123030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0110 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_11100
     * @tc.name      testTimeCube0111
     * @tc.desc      Verify concatTime(12, 30, 59) pads to 123059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0111 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(12, 30, 59)).assertEqual('123059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0111 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_11200
     * @tc.name      testTimeCube0112
     * @tc.desc      Verify concatTime(12, 59, 0) pads to 125900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0112 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(12, 59, 0)).assertEqual('125900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0112 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_11300
     * @tc.name      testTimeCube0113
     * @tc.desc      Verify concatTime(12, 59, 30) pads to 125930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0113 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(12, 59, 30)).assertEqual('125930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0113 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_11400
     * @tc.name      testTimeCube0114
     * @tc.desc      Verify concatTime(12, 59, 59) pads to 125959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0114 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(12, 59, 59)).assertEqual('125959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0114 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_11500
     * @tc.name      testTimeCube0115
     * @tc.desc      Verify concatTime(13, 0, 0) pads to 130000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0115 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(13, 0, 0)).assertEqual('130000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0115 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_11600
     * @tc.name      testTimeCube0116
     * @tc.desc      Verify concatTime(13, 0, 30) pads to 130030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0116 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(13, 0, 30)).assertEqual('130030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0116 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_11700
     * @tc.name      testTimeCube0117
     * @tc.desc      Verify concatTime(13, 0, 59) pads to 130059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0117 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(13, 0, 59)).assertEqual('130059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0117 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_11800
     * @tc.name      testTimeCube0118
     * @tc.desc      Verify concatTime(13, 30, 0) pads to 133000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0118 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(13, 30, 0)).assertEqual('133000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0118 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_11900
     * @tc.name      testTimeCube0119
     * @tc.desc      Verify concatTime(13, 30, 30) pads to 133030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0119 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(13, 30, 30)).assertEqual('133030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0119 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP3_12000
     * @tc.name      testTimeCube0120
     * @tc.desc      Verify concatTime(13, 30, 59) pads to 133059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0120 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(13, 30, 59)).assertEqual('133059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0120 end');
    })

  })
}
