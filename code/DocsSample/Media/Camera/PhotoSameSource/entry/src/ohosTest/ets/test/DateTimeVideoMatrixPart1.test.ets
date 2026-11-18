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

export default function DateTimeVideoMatrixPart1Test(): void {
  describe('DateTimeVideoMatrixPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_DTVP1_0100
     * @tc.name      testGetVideoTime0001
     * @tc.desc      Verify getVideoTime(0) returns '00 : 00'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0001 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(0)).assertEqual('00 : 00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_0200
     * @tc.name      testGetVideoTime0002
     * @tc.desc      Verify getVideoTime(1) returns '00 : 00'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0002 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(1)).assertEqual('00 : 00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_0300
     * @tc.name      testGetVideoTime0003
     * @tc.desc      Verify getVideoTime(999) returns '00 : 00'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0003 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(999)).assertEqual('00 : 00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_0400
     * @tc.name      testGetVideoTime0004
     * @tc.desc      Verify getVideoTime(1000) returns '00 : 01'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0004 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(1000)).assertEqual('00 : 01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_0500
     * @tc.name      testGetVideoTime0005
     * @tc.desc      Verify getVideoTime(1999) returns '00 : 01'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0005 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(1999)).assertEqual('00 : 01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_0600
     * @tc.name      testGetVideoTime0006
     * @tc.desc      Verify getVideoTime(59999) returns '00 : 59'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0006 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(59999)).assertEqual('00 : 59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_0700
     * @tc.name      testGetVideoTime0007
     * @tc.desc      Verify getVideoTime(60000) returns '01 : 00'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0007 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(60000)).assertEqual('01 : 00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_0800
     * @tc.name      testGetVideoTime0008
     * @tc.desc      Verify getVideoTime(60001) returns '01 : 00'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0008 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(60001)).assertEqual('01 : 00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_0900
     * @tc.name      testGetVideoTime0009
     * @tc.desc      Verify getVideoTime(61000) returns '01 : 01'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0009 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(61000)).assertEqual('01 : 01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_1000
     * @tc.name      testGetVideoTime0010
     * @tc.desc      Verify getVideoTime(119000) returns '01 : 59'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0010 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(119000)).assertEqual('01 : 59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_1100
     * @tc.name      testGetVideoTime0011
     * @tc.desc      Verify getVideoTime(3599999) returns '59 : 59'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0011 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(3599999)).assertEqual('59 : 59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_1200
     * @tc.name      testGetVideoTime0012
     * @tc.desc      Verify getVideoTime(3600000) returns '60 : 00'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0012 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(3600000)).assertEqual('60 : 00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0012 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_1300
     * @tc.name      testGetVideoTime0013
     * @tc.desc      Verify getVideoTime(3661000) returns '61 : 01'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0013 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(3661000)).assertEqual('61 : 01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0013 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_1400
     * @tc.name      testGetVideoTime0014
     * @tc.desc      Verify getVideoTime(7200000) returns '120 : 00'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0014 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(7200000)).assertEqual('120 : 00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0014 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_1500
     * @tc.name      testGetVideoTime0015
     * @tc.desc      Verify getVideoTime(7323000) returns '122 : 03'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGetVideoTime0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0015 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.getVideoTime(7323000)).assertEqual('122 : 03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetVideoTime0015 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_1600
     * @tc.name      testGetTimeShape0016
     * @tc.desc      Verify getTime returns six digits shaped HHMMSS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGetTimeShape0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetTimeShape0016 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      const value: string = util.getTime();
      expect(value.length).assertEqual(6);
      for (let i: number = 0; i < value.length; i++) {
        expect('0123456789'.includes(value.charAt(i))).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetTimeShape0016 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_1700
     * @tc.name      testGetTimeRanges0017
     * @tc.desc      Verify getTime hour minute second pairs are inside clock ranges.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGetTimeRanges0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetTimeRanges0017 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      const value: string = util.getTime();
      expect(parseInt(value.substring(0, 2)) <= 23).assertTrue();
      expect(parseInt(value.substring(2, 4)) <= 59).assertTrue();
      expect(parseInt(value.substring(4, 6)) <= 59).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetTimeRanges0017 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_1800
     * @tc.name      testGetDateShape0018
     * @tc.desc      Verify getDate returns eight digits shaped YYYYMMDD.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGetDateShape0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetDateShape0018 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      const value: string = util.getDate();
      expect(value.length).assertEqual(8);
      for (let i: number = 0; i < value.length; i++) {
        expect('0123456789'.includes(value.charAt(i))).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetDateShape0018 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTVP1_1900
     * @tc.name      testGetDateCurrentYear0019
     * @tc.desc      Verify getDate starts with the current year.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGetDateCurrentYear0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetDateCurrentYear0019 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      const now: Date = new Date();
      expect(util.getDate().startsWith(now.getFullYear().toString())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGetDateCurrentYear0019 end');
    })

  })
}
