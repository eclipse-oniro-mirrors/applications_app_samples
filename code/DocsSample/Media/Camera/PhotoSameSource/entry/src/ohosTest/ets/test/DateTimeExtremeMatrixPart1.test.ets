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



export default function DateTimeExtremeMatrixPart1Test(): void {
  describe('DateTimeExtremeMatrixPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_DTXP1_0100
     * @tc.name      testVideoTimeExtreme0001
     * @tc.desc      Verify getVideoTime(1500) returns '00 : 01'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoTimeExtreme0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0001 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(1500)).assertEqual('00 : 01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTXP1_0200
     * @tc.name      testVideoTimeExtreme0002
     * @tc.desc      Verify getVideoTime(1998) returns '00 : 01'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoTimeExtreme0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0002 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(1998)).assertEqual('00 : 01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTXP1_0300
     * @tc.name      testVideoTimeExtreme0003
     * @tc.desc      Verify getVideoTime(2500) returns '00 : 02'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoTimeExtreme0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0003 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(2500)).assertEqual('00 : 02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTXP1_0400
     * @tc.name      testVideoTimeExtreme0004
     * @tc.desc      Verify getVideoTime(59999.9) returns '00 : 59'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoTimeExtreme0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0004 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(59999.9)).assertEqual('00 : 59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTXP1_0500
     * @tc.name      testVideoTimeExtreme0005
     * @tc.desc      Verify getVideoTime(60000.5) returns '01 : 00'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoTimeExtreme0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0005 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(60000.5)).assertEqual('01 : 00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTXP1_0600
     * @tc.name      testVideoTimeExtreme0006
     * @tc.desc      Verify getVideoTime(6000000) returns '100 : 00'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoTimeExtreme0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0006 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(6000000)).assertEqual('100 : 00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTXP1_0700
     * @tc.name      testVideoTimeExtreme0007
     * @tc.desc      Verify getVideoTime(6061000) returns '101 : 01'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoTimeExtreme0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0007 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(6061000)).assertEqual('101 : 01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTXP1_0800
     * @tc.name      testVideoTimeExtreme0008
     * @tc.desc      Verify getVideoTime(86400000) returns '1440 : 00'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoTimeExtreme0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0008 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(86400000)).assertEqual('1440 : 00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTXP1_0900
     * @tc.name      testVideoTimeExtreme0009
     * @tc.desc      Verify getVideoTime(90061000) returns '1501 : 01'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVideoTimeExtreme0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0009 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(90061000)).assertEqual('1501 : 01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testVideoTimeExtreme0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTXP1_1000
     * @tc.name      testConcatDateUnchecked0010
     * @tc.desc      Verify concatDate(2026, 0, 1) returns 20260001.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConcatDateUnchecked0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDateUnchecked0010 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 0, 1)).assertEqual('20260001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDateUnchecked0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTXP1_1100
     * @tc.name      testConcatDateUnchecked0011
     * @tc.desc      Verify concatDate(2026, 13, 1) returns 20261301.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConcatDateUnchecked0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDateUnchecked0011 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 13, 1)).assertEqual('20261301');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDateUnchecked0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTXP1_1200
     * @tc.name      testConcatDateUnchecked0012
     * @tc.desc      Verify concatDate(2026, 1, 0) returns 20260100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConcatDateUnchecked0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDateUnchecked0012 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 1, 0)).assertEqual('20260100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDateUnchecked0012 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTXP1_1300
     * @tc.name      testConcatDateUnchecked0013
     * @tc.desc      Verify concatDate(2026, 1, 32) returns 20260132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConcatDateUnchecked0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDateUnchecked0013 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 1, 32)).assertEqual('20260132');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDateUnchecked0013 end');
    })

  })
}
