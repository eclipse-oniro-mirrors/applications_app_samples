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
import { hilog } from '@kit.PerformanceAnalysisKit';
import DateTimeUtil, { dateTime } from '../../../main/ets/utils/DateTimeUtil';

const util: DateTimeUtil = new DateTimeUtil();

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AVRecorder]';

export default function DateTimeFillMatrixPart1Test(): void {
  describe('DateTimeFillMatrixPart1', () => {

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_0100
     * @tc.name      testFill0001
     * @tc.desc      Verify validate fill value 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0001 begin');
      expect(util.fill(0)).assertEqual('00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0001 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_0200
     * @tc.name      testFill0002
     * @tc.desc      Verify validate fill value 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0002 begin');
      expect(util.fill(1)).assertEqual('01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0002 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_0300
     * @tc.name      testFill0003
     * @tc.desc      Verify validate fill value 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0003 begin');
      expect(util.fill(2)).assertEqual('02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0003 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_0400
     * @tc.name      testFill0004
     * @tc.desc      Verify validate fill value 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0004 begin');
      expect(util.fill(3)).assertEqual('03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0004 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_0500
     * @tc.name      testFill0005
     * @tc.desc      Verify validate fill value 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0005 begin');
      expect(util.fill(4)).assertEqual('04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0005 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_0600
     * @tc.name      testFill0006
     * @tc.desc      Verify validate fill value 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0006 begin');
      expect(util.fill(5)).assertEqual('05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0006 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_0700
     * @tc.name      testFill0007
     * @tc.desc      Verify validate fill value 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0007 begin');
      expect(util.fill(6)).assertEqual('06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0007 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_0800
     * @tc.name      testFill0008
     * @tc.desc      Verify validate fill value 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0008 begin');
      expect(util.fill(7)).assertEqual('07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0008 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_0900
     * @tc.name      testFill0009
     * @tc.desc      Verify validate fill value 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0009 begin');
      expect(util.fill(8)).assertEqual('08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0009 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_1000
     * @tc.name      testFill0010
     * @tc.desc      Verify validate fill value 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0010 begin');
      expect(util.fill(9)).assertEqual('09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0010 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_1100
     * @tc.name      testFill0011
     * @tc.desc      Verify validate fill value 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0011 begin');
      expect(util.fill(10)).assertEqual('10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0011 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_1200
     * @tc.name      testFill0012
     * @tc.desc      Verify validate fill value 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0012 begin');
      expect(util.fill(11)).assertEqual('11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0012 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_1300
     * @tc.name      testFill0013
     * @tc.desc      Verify validate fill value 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0013 begin');
      expect(util.fill(12)).assertEqual('12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0013 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_1400
     * @tc.name      testFill0014
     * @tc.desc      Verify validate fill value 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0014 begin');
      expect(util.fill(13)).assertEqual('13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0014 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_1500
     * @tc.name      testFill0015
     * @tc.desc      Verify validate fill value 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0015 begin');
      expect(util.fill(14)).assertEqual('14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0015 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_1600
     * @tc.name      testFill0016
     * @tc.desc      Verify validate fill value 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0016 begin');
      expect(util.fill(15)).assertEqual('15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0016 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_1700
     * @tc.name      testFill0017
     * @tc.desc      Verify validate fill value 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0017 begin');
      expect(util.fill(16)).assertEqual('16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0017 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_1800
     * @tc.name      testFill0018
     * @tc.desc      Verify validate fill value 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0018 begin');
      expect(util.fill(17)).assertEqual('17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0018 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_1900
     * @tc.name      testFill0019
     * @tc.desc      Verify validate fill value 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0019 begin');
      expect(util.fill(18)).assertEqual('18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0019 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_2000
     * @tc.name      testFill0020
     * @tc.desc      Verify validate fill value 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0020 begin');
      expect(util.fill(19)).assertEqual('19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0020 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_2100
     * @tc.name      testFill0021
     * @tc.desc      Verify validate fill value 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0021 begin');
      expect(util.fill(20)).assertEqual('20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0021 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_2200
     * @tc.name      testFill0022
     * @tc.desc      Verify validate fill value 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0022 begin');
      expect(util.fill(21)).assertEqual('21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0022 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_2300
     * @tc.name      testFill0023
     * @tc.desc      Verify validate fill value 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0023 begin');
      expect(util.fill(22)).assertEqual('22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0023 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_2400
     * @tc.name      testFill0024
     * @tc.desc      Verify validate fill value 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0024 begin');
      expect(util.fill(23)).assertEqual('23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0024 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_2500
     * @tc.name      testFill0025
     * @tc.desc      Verify validate fill value 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0025 begin');
      expect(util.fill(24)).assertEqual('24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0025 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_2600
     * @tc.name      testFill0026
     * @tc.desc      Verify validate fill value 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0026 begin');
      expect(util.fill(25)).assertEqual('25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0026 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_2700
     * @tc.name      testFill0027
     * @tc.desc      Verify validate fill value 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0027 begin');
      expect(util.fill(26)).assertEqual('26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0027 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_2800
     * @tc.name      testFill0028
     * @tc.desc      Verify validate fill value 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0028 begin');
      expect(util.fill(27)).assertEqual('27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0028 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_2900
     * @tc.name      testFill0029
     * @tc.desc      Verify validate fill value 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0029 begin');
      expect(util.fill(28)).assertEqual('28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0029 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_3000
     * @tc.name      testFill0030
     * @tc.desc      Verify validate fill value 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0030 begin');
      expect(util.fill(29)).assertEqual('29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0030 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_3100
     * @tc.name      testFill0031
     * @tc.desc      Verify validate fill value 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0031 begin');
      expect(util.fill(30)).assertEqual('30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0031 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_3200
     * @tc.name      testFill0032
     * @tc.desc      Verify validate fill value 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0032 begin');
      expect(util.fill(31)).assertEqual('31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0032 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_3300
     * @tc.name      testFill0033
     * @tc.desc      Verify validate fill value 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0033 begin');
      expect(util.fill(32)).assertEqual('32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0033 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_3400
     * @tc.name      testFill0034
     * @tc.desc      Verify validate fill value 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0034 begin');
      expect(util.fill(33)).assertEqual('33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0034 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_3500
     * @tc.name      testFill0035
     * @tc.desc      Verify validate fill value 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0035 begin');
      expect(util.fill(34)).assertEqual('34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0035 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_3600
     * @tc.name      testFill0036
     * @tc.desc      Verify validate fill value 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0036 begin');
      expect(util.fill(35)).assertEqual('35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0036 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_3700
     * @tc.name      testFill0037
     * @tc.desc      Verify validate fill value 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0037 begin');
      expect(util.fill(36)).assertEqual('36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0037 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_3800
     * @tc.name      testFill0038
     * @tc.desc      Verify validate fill value 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0038 begin');
      expect(util.fill(37)).assertEqual('37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0038 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_3900
     * @tc.name      testFill0039
     * @tc.desc      Verify validate fill value 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0039 begin');
      expect(util.fill(38)).assertEqual('38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0039 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_4000
     * @tc.name      testFill0040
     * @tc.desc      Verify validate fill value 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0040 begin');
      expect(util.fill(39)).assertEqual('39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0040 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_4100
     * @tc.name      testFill0041
     * @tc.desc      Verify validate fill value 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0041 begin');
      expect(util.fill(40)).assertEqual('40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0041 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_4200
     * @tc.name      testFill0042
     * @tc.desc      Verify validate fill value 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0042 begin');
      expect(util.fill(41)).assertEqual('41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0042 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_4300
     * @tc.name      testFill0043
     * @tc.desc      Verify validate fill value 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0043 begin');
      expect(util.fill(42)).assertEqual('42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0043 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_4400
     * @tc.name      testFill0044
     * @tc.desc      Verify validate fill value 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0044 begin');
      expect(util.fill(43)).assertEqual('43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0044 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_4500
     * @tc.name      testFill0045
     * @tc.desc      Verify validate fill value 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0045 begin');
      expect(util.fill(44)).assertEqual('44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0045 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_4600
     * @tc.name      testFill0046
     * @tc.desc      Verify validate fill value 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0046 begin');
      expect(util.fill(45)).assertEqual('45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0046 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_4700
     * @tc.name      testFill0047
     * @tc.desc      Verify validate fill value 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0047 begin');
      expect(util.fill(46)).assertEqual('46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0047 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_4800
     * @tc.name      testFill0048
     * @tc.desc      Verify validate fill value 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0048 begin');
      expect(util.fill(47)).assertEqual('47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0048 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_4900
     * @tc.name      testFill0049
     * @tc.desc      Verify validate fill value 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0049 begin');
      expect(util.fill(48)).assertEqual('48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0049 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_5000
     * @tc.name      testFill0050
     * @tc.desc      Verify validate fill value 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0050 begin');
      expect(util.fill(49)).assertEqual('49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0050 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_5100
     * @tc.name      testFill0051
     * @tc.desc      Verify validate fill value 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0051 begin');
      expect(util.fill(50)).assertEqual('50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0051 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_5200
     * @tc.name      testFill0052
     * @tc.desc      Verify validate fill value 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0052 begin');
      expect(util.fill(51)).assertEqual('51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0052 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_5300
     * @tc.name      testFill0053
     * @tc.desc      Verify validate fill value 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0053 begin');
      expect(util.fill(52)).assertEqual('52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0053 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_5400
     * @tc.name      testFill0054
     * @tc.desc      Verify validate fill value 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0054 begin');
      expect(util.fill(53)).assertEqual('53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0054 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_5500
     * @tc.name      testFill0055
     * @tc.desc      Verify validate fill value 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0055 begin');
      expect(util.fill(54)).assertEqual('54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0055 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_5600
     * @tc.name      testFill0056
     * @tc.desc      Verify validate fill value 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0056 begin');
      expect(util.fill(55)).assertEqual('55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0056 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_5700
     * @tc.name      testFill0057
     * @tc.desc      Verify validate fill value 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0057 begin');
      expect(util.fill(56)).assertEqual('56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0057 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_5800
     * @tc.name      testFill0058
     * @tc.desc      Verify validate fill value 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0058 begin');
      expect(util.fill(57)).assertEqual('57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0058 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_5900
     * @tc.name      testFill0059
     * @tc.desc      Verify validate fill value 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0059 begin');
      expect(util.fill(58)).assertEqual('58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0059 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_6000
     * @tc.name      testFill0060
     * @tc.desc      Verify validate fill value 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0060 begin');
      expect(util.fill(59)).assertEqual('59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0060 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_6100
     * @tc.name      testFill0061
     * @tc.desc      Verify validate fill value 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0061 begin');
      expect(util.fill(60)).assertEqual('60');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0061 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_6200
     * @tc.name      testFill0062
     * @tc.desc      Verify validate fill value 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0062 begin');
      expect(util.fill(61)).assertEqual('61');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0062 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_6300
     * @tc.name      testFill0063
     * @tc.desc      Verify validate fill value 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0063 begin');
      expect(util.fill(62)).assertEqual('62');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0063 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_6400
     * @tc.name      testFill0064
     * @tc.desc      Verify validate fill value 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0064 begin');
      expect(util.fill(63)).assertEqual('63');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0064 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_6500
     * @tc.name      testFill0065
     * @tc.desc      Verify validate fill value 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0065 begin');
      expect(util.fill(64)).assertEqual('64');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0065 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_6600
     * @tc.name      testFill0066
     * @tc.desc      Verify validate fill value 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0066 begin');
      expect(util.fill(65)).assertEqual('65');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0066 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_6700
     * @tc.name      testFill0067
     * @tc.desc      Verify validate fill value 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0067 begin');
      expect(util.fill(66)).assertEqual('66');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0067 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_6800
     * @tc.name      testFill0068
     * @tc.desc      Verify validate fill value 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0068 begin');
      expect(util.fill(67)).assertEqual('67');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0068 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_6900
     * @tc.name      testFill0069
     * @tc.desc      Verify validate fill value 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0069 begin');
      expect(util.fill(68)).assertEqual('68');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0069 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_7000
     * @tc.name      testFill0070
     * @tc.desc      Verify validate fill value 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0070 begin');
      expect(util.fill(69)).assertEqual('69');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0070 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_7100
     * @tc.name      testFill0071
     * @tc.desc      Verify validate fill value 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0071 begin');
      expect(util.fill(70)).assertEqual('70');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0071 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_7200
     * @tc.name      testFill0072
     * @tc.desc      Verify validate fill value 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0072 begin');
      expect(util.fill(71)).assertEqual('71');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0072 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_7300
     * @tc.name      testFill0073
     * @tc.desc      Verify validate fill value 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0073 begin');
      expect(util.fill(72)).assertEqual('72');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0073 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_7400
     * @tc.name      testFill0074
     * @tc.desc      Verify validate fill value 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0074 begin');
      expect(util.fill(73)).assertEqual('73');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0074 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_7500
     * @tc.name      testFill0075
     * @tc.desc      Verify validate fill value 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0075 begin');
      expect(util.fill(74)).assertEqual('74');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0075 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_7600
     * @tc.name      testFill0076
     * @tc.desc      Verify validate fill value 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0076 begin');
      expect(util.fill(75)).assertEqual('75');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0076 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_7700
     * @tc.name      testFill0077
     * @tc.desc      Verify validate fill value 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0077 begin');
      expect(util.fill(76)).assertEqual('76');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0077 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_7800
     * @tc.name      testFill0078
     * @tc.desc      Verify validate fill value 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0078 begin');
      expect(util.fill(77)).assertEqual('77');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0078 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_7900
     * @tc.name      testFill0079
     * @tc.desc      Verify validate fill value 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0079 begin');
      expect(util.fill(78)).assertEqual('78');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0079 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_8000
     * @tc.name      testFill0080
     * @tc.desc      Verify validate fill value 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0080 begin');
      expect(util.fill(79)).assertEqual('79');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0080 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_8100
     * @tc.name      testFill0081
     * @tc.desc      Verify validate fill value 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0081 begin');
      expect(util.fill(80)).assertEqual('80');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0081 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_8200
     * @tc.name      testFill0082
     * @tc.desc      Verify validate fill value 81.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0082 begin');
      expect(util.fill(81)).assertEqual('81');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0082 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_8300
     * @tc.name      testFill0083
     * @tc.desc      Verify validate fill value 82.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0083 begin');
      expect(util.fill(82)).assertEqual('82');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0083 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_8400
     * @tc.name      testFill0084
     * @tc.desc      Verify validate fill value 83.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0084 begin');
      expect(util.fill(83)).assertEqual('83');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0084 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_8500
     * @tc.name      testFill0085
     * @tc.desc      Verify validate fill value 84.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0085 begin');
      expect(util.fill(84)).assertEqual('84');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0085 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_8600
     * @tc.name      testFill0086
     * @tc.desc      Verify validate fill value 85.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0086 begin');
      expect(util.fill(85)).assertEqual('85');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0086 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_8700
     * @tc.name      testFill0087
     * @tc.desc      Verify validate fill value 86.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0087 begin');
      expect(util.fill(86)).assertEqual('86');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0087 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_8800
     * @tc.name      testFill0088
     * @tc.desc      Verify validate fill value 87.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0088 begin');
      expect(util.fill(87)).assertEqual('87');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0088 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_8900
     * @tc.name      testFill0089
     * @tc.desc      Verify validate fill value 88.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0089 begin');
      expect(util.fill(88)).assertEqual('88');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0089 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTFILLP1_9000
     * @tc.name      testFill0090
     * @tc.desc      Verify validate fill value 89.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFill0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0090 begin');
      expect(util.fill(89)).assertEqual('89');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFill0090 end');
    })

  })
}
