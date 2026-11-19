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

export default function DateTimeTimeCubePart6Test(): void {
  describe('DateTimeTimeCubePart6', () => {

    /**
     * @tc.number    SUB_PHOTO_TCUBP6_20100
     * @tc.name      testTimeCube0201
     * @tc.desc      Verify concatTime(22, 30, 59) pads to 223059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0201 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(22, 30, 59)).assertEqual('223059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0201 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP6_20200
     * @tc.name      testTimeCube0202
     * @tc.desc      Verify concatTime(22, 59, 0) pads to 225900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0202 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(22, 59, 0)).assertEqual('225900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0202 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP6_20300
     * @tc.name      testTimeCube0203
     * @tc.desc      Verify concatTime(22, 59, 30) pads to 225930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0203 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(22, 59, 30)).assertEqual('225930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0203 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP6_20400
     * @tc.name      testTimeCube0204
     * @tc.desc      Verify concatTime(22, 59, 59) pads to 225959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0204 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(22, 59, 59)).assertEqual('225959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0204 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP6_20500
     * @tc.name      testTimeCube0205
     * @tc.desc      Verify concatTime(23, 0, 30) pads to 230030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0205 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(23, 0, 30)).assertEqual('230030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0205 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP6_20600
     * @tc.name      testTimeCube0206
     * @tc.desc      Verify concatTime(23, 0, 59) pads to 230059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0206 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(23, 0, 59)).assertEqual('230059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0206 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP6_20700
     * @tc.name      testTimeCube0207
     * @tc.desc      Verify concatTime(23, 30, 0) pads to 233000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0207 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(23, 30, 0)).assertEqual('233000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0207 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP6_20800
     * @tc.name      testTimeCube0208
     * @tc.desc      Verify concatTime(23, 30, 30) pads to 233030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0208 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(23, 30, 30)).assertEqual('233030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0208 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP6_20900
     * @tc.name      testTimeCube0209
     * @tc.desc      Verify concatTime(23, 30, 59) pads to 233059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0209 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(23, 30, 59)).assertEqual('233059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0209 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP6_21000
     * @tc.name      testTimeCube0210
     * @tc.desc      Verify concatTime(23, 59, 0) pads to 235900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0210 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(23, 59, 0)).assertEqual('235900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0210 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP6_21100
     * @tc.name      testTimeCube0211
     * @tc.desc      Verify concatTime(23, 59, 30) pads to 235930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0211 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(23, 59, 30)).assertEqual('235930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0211 end');
    })

  })
}
