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

export default function DateTimeTimeCubePart1Test(): void {
  describe('DateTimeTimeCubePart1', () => {

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_0100
     * @tc.name      testTimeCube0001
     * @tc.desc      Verify concatTime(0, 0, 30) pads to 000030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0001 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(0, 0, 30)).assertEqual('000030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_0200
     * @tc.name      testTimeCube0002
     * @tc.desc      Verify concatTime(0, 30, 0) pads to 003000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0002 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(0, 30, 0)).assertEqual('003000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_0300
     * @tc.name      testTimeCube0003
     * @tc.desc      Verify concatTime(0, 30, 30) pads to 003030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0003 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(0, 30, 30)).assertEqual('003030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_0400
     * @tc.name      testTimeCube0004
     * @tc.desc      Verify concatTime(0, 30, 59) pads to 003059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0004 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(0, 30, 59)).assertEqual('003059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_0500
     * @tc.name      testTimeCube0005
     * @tc.desc      Verify concatTime(0, 59, 30) pads to 005930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0005 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(0, 59, 30)).assertEqual('005930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_0600
     * @tc.name      testTimeCube0006
     * @tc.desc      Verify concatTime(0, 59, 59) pads to 005959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0006 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(0, 59, 59)).assertEqual('005959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_0700
     * @tc.name      testTimeCube0007
     * @tc.desc      Verify concatTime(1, 0, 0) pads to 010000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0007 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(1, 0, 0)).assertEqual('010000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_0800
     * @tc.name      testTimeCube0008
     * @tc.desc      Verify concatTime(1, 0, 30) pads to 010030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0008 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(1, 0, 30)).assertEqual('010030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_0900
     * @tc.name      testTimeCube0009
     * @tc.desc      Verify concatTime(1, 0, 59) pads to 010059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0009 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(1, 0, 59)).assertEqual('010059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_1000
     * @tc.name      testTimeCube0010
     * @tc.desc      Verify concatTime(1, 30, 0) pads to 013000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0010 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(1, 30, 0)).assertEqual('013000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_1100
     * @tc.name      testTimeCube0011
     * @tc.desc      Verify concatTime(1, 30, 30) pads to 013030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0011 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(1, 30, 30)).assertEqual('013030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_1200
     * @tc.name      testTimeCube0012
     * @tc.desc      Verify concatTime(1, 30, 59) pads to 013059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0012 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(1, 30, 59)).assertEqual('013059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0012 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_1300
     * @tc.name      testTimeCube0013
     * @tc.desc      Verify concatTime(1, 59, 0) pads to 015900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0013 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(1, 59, 0)).assertEqual('015900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0013 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_1400
     * @tc.name      testTimeCube0014
     * @tc.desc      Verify concatTime(1, 59, 30) pads to 015930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0014 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(1, 59, 30)).assertEqual('015930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0014 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_1500
     * @tc.name      testTimeCube0015
     * @tc.desc      Verify concatTime(1, 59, 59) pads to 015959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0015 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(1, 59, 59)).assertEqual('015959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0015 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_1600
     * @tc.name      testTimeCube0016
     * @tc.desc      Verify concatTime(2, 0, 0) pads to 020000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0016 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(2, 0, 0)).assertEqual('020000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0016 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_1700
     * @tc.name      testTimeCube0017
     * @tc.desc      Verify concatTime(2, 0, 30) pads to 020030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0017 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(2, 0, 30)).assertEqual('020030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0017 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_1800
     * @tc.name      testTimeCube0018
     * @tc.desc      Verify concatTime(2, 0, 59) pads to 020059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0018 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(2, 0, 59)).assertEqual('020059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0018 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_1900
     * @tc.name      testTimeCube0019
     * @tc.desc      Verify concatTime(2, 30, 0) pads to 023000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0019 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(2, 30, 0)).assertEqual('023000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0019 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_2000
     * @tc.name      testTimeCube0020
     * @tc.desc      Verify concatTime(2, 30, 30) pads to 023030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0020 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(2, 30, 30)).assertEqual('023030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0020 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_2100
     * @tc.name      testTimeCube0021
     * @tc.desc      Verify concatTime(2, 30, 59) pads to 023059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0021 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(2, 30, 59)).assertEqual('023059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0021 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_2200
     * @tc.name      testTimeCube0022
     * @tc.desc      Verify concatTime(2, 59, 0) pads to 025900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0022 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(2, 59, 0)).assertEqual('025900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0022 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_2300
     * @tc.name      testTimeCube0023
     * @tc.desc      Verify concatTime(2, 59, 30) pads to 025930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0023 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(2, 59, 30)).assertEqual('025930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0023 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_2400
     * @tc.name      testTimeCube0024
     * @tc.desc      Verify concatTime(2, 59, 59) pads to 025959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0024 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(2, 59, 59)).assertEqual('025959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0024 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_2500
     * @tc.name      testTimeCube0025
     * @tc.desc      Verify concatTime(3, 0, 0) pads to 030000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0025 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(3, 0, 0)).assertEqual('030000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0025 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_2600
     * @tc.name      testTimeCube0026
     * @tc.desc      Verify concatTime(3, 0, 30) pads to 030030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0026 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(3, 0, 30)).assertEqual('030030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0026 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_2700
     * @tc.name      testTimeCube0027
     * @tc.desc      Verify concatTime(3, 0, 59) pads to 030059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0027 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(3, 0, 59)).assertEqual('030059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0027 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_2800
     * @tc.name      testTimeCube0028
     * @tc.desc      Verify concatTime(3, 30, 0) pads to 033000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0028 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(3, 30, 0)).assertEqual('033000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0028 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_2900
     * @tc.name      testTimeCube0029
     * @tc.desc      Verify concatTime(3, 30, 30) pads to 033030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0029 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(3, 30, 30)).assertEqual('033030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0029 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_3000
     * @tc.name      testTimeCube0030
     * @tc.desc      Verify concatTime(3, 30, 59) pads to 033059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0030 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(3, 30, 59)).assertEqual('033059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0030 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_3100
     * @tc.name      testTimeCube0031
     * @tc.desc      Verify concatTime(3, 59, 0) pads to 035900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0031 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(3, 59, 0)).assertEqual('035900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0031 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_3200
     * @tc.name      testTimeCube0032
     * @tc.desc      Verify concatTime(3, 59, 30) pads to 035930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0032 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(3, 59, 30)).assertEqual('035930');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0032 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_3300
     * @tc.name      testTimeCube0033
     * @tc.desc      Verify concatTime(3, 59, 59) pads to 035959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0033 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(3, 59, 59)).assertEqual('035959');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0033 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_3400
     * @tc.name      testTimeCube0034
     * @tc.desc      Verify concatTime(4, 0, 0) pads to 040000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0034 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(4, 0, 0)).assertEqual('040000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0034 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_3500
     * @tc.name      testTimeCube0035
     * @tc.desc      Verify concatTime(4, 0, 30) pads to 040030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0035 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(4, 0, 30)).assertEqual('040030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0035 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_3600
     * @tc.name      testTimeCube0036
     * @tc.desc      Verify concatTime(4, 0, 59) pads to 040059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0036 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(4, 0, 59)).assertEqual('040059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0036 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_3700
     * @tc.name      testTimeCube0037
     * @tc.desc      Verify concatTime(4, 30, 0) pads to 043000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0037 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(4, 30, 0)).assertEqual('043000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0037 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_3800
     * @tc.name      testTimeCube0038
     * @tc.desc      Verify concatTime(4, 30, 30) pads to 043030.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0038 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(4, 30, 30)).assertEqual('043030');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0038 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_3900
     * @tc.name      testTimeCube0039
     * @tc.desc      Verify concatTime(4, 30, 59) pads to 043059.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0039 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(4, 30, 59)).assertEqual('043059');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0039 end');
    })

    /**
     * @tc.number    SUB_PHOTO_TCUBP1_4000
     * @tc.name      testTimeCube0040
     * @tc.desc      Verify concatTime(4, 59, 0) pads to 045900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeCube0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0040 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(4, 59, 0)).assertEqual('045900');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeCube0040 end');
    })

  })
}
