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

export default function DateTimeFormatMatrixPart1Test(): void {
  describe('DateTimeFormatMatrixPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_DTFP1_0100
     * @tc.name      testFill0001
     * @tc.desc      Verify fill(0) returns 00.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0001 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_0200
     * @tc.name      testFill0002
     * @tc.desc      Verify fill(1) returns 01.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0002 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(1)).assertEqual('01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_0300
     * @tc.name      testFill0003
     * @tc.desc      Verify fill(2) returns 02.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0003 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(2)).assertEqual('02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_0400
     * @tc.name      testFill0004
     * @tc.desc      Verify fill(3) returns 03.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0004 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(3)).assertEqual('03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_0500
     * @tc.name      testFill0005
     * @tc.desc      Verify fill(4) returns 04.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0005 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(4)).assertEqual('04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_0600
     * @tc.name      testFill0006
     * @tc.desc      Verify fill(5) returns 05.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0006 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(5)).assertEqual('05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_0700
     * @tc.name      testFill0007
     * @tc.desc      Verify fill(6) returns 06.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0007 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(6)).assertEqual('06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_0800
     * @tc.name      testFill0008
     * @tc.desc      Verify fill(7) returns 07.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0008 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(7)).assertEqual('07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_0900
     * @tc.name      testFill0009
     * @tc.desc      Verify fill(8) returns 08.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0009 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(8)).assertEqual('08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_1000
     * @tc.name      testFill0010
     * @tc.desc      Verify fill(9) returns 09.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0010 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(9)).assertEqual('09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_1100
     * @tc.name      testFill0011
     * @tc.desc      Verify fill(10) returns 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0011 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(10)).assertEqual('10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_1200
     * @tc.name      testFill0012
     * @tc.desc      Verify fill(11) returns 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0012 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(11)).assertEqual('11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0012 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_1300
     * @tc.name      testFill0013
     * @tc.desc      Verify fill(12) returns 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0013 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(12)).assertEqual('12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0013 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_1400
     * @tc.name      testFill0014
     * @tc.desc      Verify fill(13) returns 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0014 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(13)).assertEqual('13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0014 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_1500
     * @tc.name      testFill0015
     * @tc.desc      Verify fill(14) returns 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0015 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(14)).assertEqual('14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0015 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_1600
     * @tc.name      testFill0016
     * @tc.desc      Verify fill(15) returns 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0016 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(15)).assertEqual('15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0016 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_1700
     * @tc.name      testFill0017
     * @tc.desc      Verify fill(16) returns 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0017 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(16)).assertEqual('16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0017 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_1800
     * @tc.name      testFill0018
     * @tc.desc      Verify fill(17) returns 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0018 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(17)).assertEqual('17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0018 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_1900
     * @tc.name      testFill0019
     * @tc.desc      Verify fill(18) returns 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0019 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(18)).assertEqual('18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0019 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_2000
     * @tc.name      testFill0020
     * @tc.desc      Verify fill(19) returns 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0020 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(19)).assertEqual('19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0020 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_2100
     * @tc.name      testFill0021
     * @tc.desc      Verify fill(20) returns 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0021 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(20)).assertEqual('20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0021 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_2200
     * @tc.name      testFill0022
     * @tc.desc      Verify fill(21) returns 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0022 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(21)).assertEqual('21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0022 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_2300
     * @tc.name      testFill0023
     * @tc.desc      Verify fill(22) returns 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0023 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(22)).assertEqual('22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0023 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_2400
     * @tc.name      testFill0024
     * @tc.desc      Verify fill(23) returns 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0024 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(23)).assertEqual('23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0024 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_2500
     * @tc.name      testFill0025
     * @tc.desc      Verify fill(24) returns 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0025 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(24)).assertEqual('24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0025 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_2600
     * @tc.name      testFill0026
     * @tc.desc      Verify fill(25) returns 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0026 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(25)).assertEqual('25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0026 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_2700
     * @tc.name      testFill0027
     * @tc.desc      Verify fill(26) returns 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0027 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(26)).assertEqual('26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0027 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_2800
     * @tc.name      testFill0028
     * @tc.desc      Verify fill(27) returns 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0028 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(27)).assertEqual('27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0028 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_2900
     * @tc.name      testFill0029
     * @tc.desc      Verify fill(28) returns 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0029 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(28)).assertEqual('28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0029 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_3000
     * @tc.name      testFill0030
     * @tc.desc      Verify fill(29) returns 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0030 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(29)).assertEqual('29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0030 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_3100
     * @tc.name      testFill0031
     * @tc.desc      Verify fill(30) returns 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0031 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(30)).assertEqual('30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0031 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_3200
     * @tc.name      testFill0032
     * @tc.desc      Verify fill(99) returns 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0032 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(99)).assertEqual('99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0032 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_3300
     * @tc.name      testFill0033
     * @tc.desc      Verify fill(100) returns 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0033 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(100)).assertEqual('100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0033 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_3400
     * @tc.name      testFill0034
     * @tc.desc      Verify fill(101) returns 101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0034 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(101)).assertEqual('101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0034 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_3500
     * @tc.name      testFill0035
     * @tc.desc      Verify fill(999) returns 999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0035 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(999)).assertEqual('999');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0035 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_3600
     * @tc.name      testFill0036
     * @tc.desc      Verify fill(1000) returns 1000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0036 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(1000)).assertEqual('1000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0036 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_3700
     * @tc.name      testFill0037
     * @tc.desc      Verify fill(-1) returns 0-1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0037 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(-1)).assertEqual('0-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0037 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_3800
     * @tc.name      testConcatDate0038
     * @tc.desc      Verify concatDate(2026, 1, 1) returns 20260101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0038 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 1, 1)).assertEqual('20260101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0038 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_3900
     * @tc.name      testConcatDate0039
     * @tc.desc      Verify concatDate(2026, 12, 31) returns 20261231.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0039 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 12, 31)).assertEqual('20261231');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0039 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_4000
     * @tc.name      testConcatDate0040
     * @tc.desc      Verify concatDate(2000, 2, 29) returns 20000229.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0040 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2000, 2, 29)).assertEqual('20000229');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0040 end');
    })

    /**
     * @tc.number    SUB_PHOTO_DTFP1_4100
     * @tc.name      testConcatDate0041
     * @tc.desc      Verify concatDate(1970, 1, 1) returns 19700101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0041 begin');
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(1970, 1, 1)).assertEqual('19700101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConcatDate0041 end');
    })

  })
}
