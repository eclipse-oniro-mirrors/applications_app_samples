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

export default function DateTimeCountdownMatrixPart1Test(): void {
  describe('DateTimeCountdownMatrixPart1', () => {

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_0100
     * @tc.name      testCountdown0001
     * @tc.desc      Verify countdown text for 0 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0001 begin');
      expect(dateTime(0)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0001 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_0200
     * @tc.name      testCountdown0002
     * @tc.desc      Verify countdown text for 1 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0002 begin');
      expect(dateTime(1)).assertEqual('00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0002 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_0300
     * @tc.name      testCountdown0003
     * @tc.desc      Verify countdown text for 2 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0003 begin');
      expect(dateTime(2)).assertEqual('00:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0003 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_0400
     * @tc.name      testCountdown0004
     * @tc.desc      Verify countdown text for 3 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0004 begin');
      expect(dateTime(3)).assertEqual('00:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0004 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_0500
     * @tc.name      testCountdown0005
     * @tc.desc      Verify countdown text for 4 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0005 begin');
      expect(dateTime(4)).assertEqual('00:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0005 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_0600
     * @tc.name      testCountdown0006
     * @tc.desc      Verify countdown text for 5 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0006 begin');
      expect(dateTime(5)).assertEqual('00:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0006 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_0700
     * @tc.name      testCountdown0007
     * @tc.desc      Verify countdown text for 6 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0007 begin');
      expect(dateTime(6)).assertEqual('00:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0007 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_0800
     * @tc.name      testCountdown0008
     * @tc.desc      Verify countdown text for 7 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0008 begin');
      expect(dateTime(7)).assertEqual('00:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0008 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_0900
     * @tc.name      testCountdown0009
     * @tc.desc      Verify countdown text for 8 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0009 begin');
      expect(dateTime(8)).assertEqual('00:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0009 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_1000
     * @tc.name      testCountdown0010
     * @tc.desc      Verify countdown text for 9 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0010 begin');
      expect(dateTime(9)).assertEqual('00:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0010 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_1100
     * @tc.name      testCountdown0011
     * @tc.desc      Verify countdown text for 10 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0011 begin');
      expect(dateTime(10)).assertEqual('00:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0011 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_1200
     * @tc.name      testCountdown0012
     * @tc.desc      Verify countdown text for 11 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0012 begin');
      expect(dateTime(11)).assertEqual('00:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0012 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_1300
     * @tc.name      testCountdown0013
     * @tc.desc      Verify countdown text for 12 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0013 begin');
      expect(dateTime(12)).assertEqual('00:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0013 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_1400
     * @tc.name      testCountdown0014
     * @tc.desc      Verify countdown text for 13 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0014 begin');
      expect(dateTime(13)).assertEqual('00:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0014 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_1500
     * @tc.name      testCountdown0015
     * @tc.desc      Verify countdown text for 14 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0015 begin');
      expect(dateTime(14)).assertEqual('00:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0015 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_1600
     * @tc.name      testCountdown0016
     * @tc.desc      Verify countdown text for 15 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0016 begin');
      expect(dateTime(15)).assertEqual('00:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0016 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_1700
     * @tc.name      testCountdown0017
     * @tc.desc      Verify countdown text for 16 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0017 begin');
      expect(dateTime(16)).assertEqual('00:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0017 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_1800
     * @tc.name      testCountdown0018
     * @tc.desc      Verify countdown text for 17 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0018 begin');
      expect(dateTime(17)).assertEqual('00:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0018 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_1900
     * @tc.name      testCountdown0019
     * @tc.desc      Verify countdown text for 18 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0019 begin');
      expect(dateTime(18)).assertEqual('00:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0019 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_2000
     * @tc.name      testCountdown0020
     * @tc.desc      Verify countdown text for 19 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0020 begin');
      expect(dateTime(19)).assertEqual('00:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0020 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_2100
     * @tc.name      testCountdown0021
     * @tc.desc      Verify countdown text for 20 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0021 begin');
      expect(dateTime(20)).assertEqual('00:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0021 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_2200
     * @tc.name      testCountdown0022
     * @tc.desc      Verify countdown text for 21 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0022 begin');
      expect(dateTime(21)).assertEqual('00:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0022 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_2300
     * @tc.name      testCountdown0023
     * @tc.desc      Verify countdown text for 22 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0023 begin');
      expect(dateTime(22)).assertEqual('00:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0023 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_2400
     * @tc.name      testCountdown0024
     * @tc.desc      Verify countdown text for 23 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0024 begin');
      expect(dateTime(23)).assertEqual('00:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0024 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_2500
     * @tc.name      testCountdown0025
     * @tc.desc      Verify countdown text for 24 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0025 begin');
      expect(dateTime(24)).assertEqual('00:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0025 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_2600
     * @tc.name      testCountdown0026
     * @tc.desc      Verify countdown text for 25 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0026 begin');
      expect(dateTime(25)).assertEqual('00:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0026 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_2700
     * @tc.name      testCountdown0027
     * @tc.desc      Verify countdown text for 26 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0027 begin');
      expect(dateTime(26)).assertEqual('00:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0027 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_2800
     * @tc.name      testCountdown0028
     * @tc.desc      Verify countdown text for 27 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0028 begin');
      expect(dateTime(27)).assertEqual('00:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0028 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_2900
     * @tc.name      testCountdown0029
     * @tc.desc      Verify countdown text for 28 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0029 begin');
      expect(dateTime(28)).assertEqual('00:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0029 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_3000
     * @tc.name      testCountdown0030
     * @tc.desc      Verify countdown text for 29 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0030 begin');
      expect(dateTime(29)).assertEqual('00:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0030 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_3100
     * @tc.name      testCountdown0031
     * @tc.desc      Verify countdown text for 30 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0031 begin');
      expect(dateTime(30)).assertEqual('00:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0031 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_3200
     * @tc.name      testCountdown0032
     * @tc.desc      Verify countdown text for 31 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0032 begin');
      expect(dateTime(31)).assertEqual('00:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0032 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_3300
     * @tc.name      testCountdown0033
     * @tc.desc      Verify countdown text for 32 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0033 begin');
      expect(dateTime(32)).assertEqual('00:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0033 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_3400
     * @tc.name      testCountdown0034
     * @tc.desc      Verify countdown text for 33 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0034 begin');
      expect(dateTime(33)).assertEqual('00:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0034 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_3500
     * @tc.name      testCountdown0035
     * @tc.desc      Verify countdown text for 34 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0035 begin');
      expect(dateTime(34)).assertEqual('00:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0035 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_3600
     * @tc.name      testCountdown0036
     * @tc.desc      Verify countdown text for 35 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0036 begin');
      expect(dateTime(35)).assertEqual('00:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0036 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_3700
     * @tc.name      testCountdown0037
     * @tc.desc      Verify countdown text for 36 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0037 begin');
      expect(dateTime(36)).assertEqual('00:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0037 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_3800
     * @tc.name      testCountdown0038
     * @tc.desc      Verify countdown text for 37 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0038 begin');
      expect(dateTime(37)).assertEqual('00:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0038 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_3900
     * @tc.name      testCountdown0039
     * @tc.desc      Verify countdown text for 38 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0039 begin');
      expect(dateTime(38)).assertEqual('00:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0039 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_4000
     * @tc.name      testCountdown0040
     * @tc.desc      Verify countdown text for 39 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0040 begin');
      expect(dateTime(39)).assertEqual('00:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0040 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_4100
     * @tc.name      testCountdown0041
     * @tc.desc      Verify countdown text for 40 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0041 begin');
      expect(dateTime(40)).assertEqual('00:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0041 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_4200
     * @tc.name      testCountdown0042
     * @tc.desc      Verify countdown text for 41 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0042 begin');
      expect(dateTime(41)).assertEqual('00:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0042 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_4300
     * @tc.name      testCountdown0043
     * @tc.desc      Verify countdown text for 42 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0043 begin');
      expect(dateTime(42)).assertEqual('00:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0043 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_4400
     * @tc.name      testCountdown0044
     * @tc.desc      Verify countdown text for 43 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0044 begin');
      expect(dateTime(43)).assertEqual('00:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0044 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_4500
     * @tc.name      testCountdown0045
     * @tc.desc      Verify countdown text for 44 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0045 begin');
      expect(dateTime(44)).assertEqual('00:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0045 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_4600
     * @tc.name      testCountdown0046
     * @tc.desc      Verify countdown text for 45 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0046 begin');
      expect(dateTime(45)).assertEqual('00:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0046 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_4700
     * @tc.name      testCountdown0047
     * @tc.desc      Verify countdown text for 46 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0047 begin');
      expect(dateTime(46)).assertEqual('00:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0047 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_4800
     * @tc.name      testCountdown0048
     * @tc.desc      Verify countdown text for 47 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0048 begin');
      expect(dateTime(47)).assertEqual('00:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0048 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_4900
     * @tc.name      testCountdown0049
     * @tc.desc      Verify countdown text for 48 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0049 begin');
      expect(dateTime(48)).assertEqual('00:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0049 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_5000
     * @tc.name      testCountdown0050
     * @tc.desc      Verify countdown text for 49 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0050 begin');
      expect(dateTime(49)).assertEqual('00:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0050 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_5100
     * @tc.name      testCountdown0051
     * @tc.desc      Verify countdown text for 50 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0051 begin');
      expect(dateTime(50)).assertEqual('00:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0051 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_5200
     * @tc.name      testCountdown0052
     * @tc.desc      Verify countdown text for 51 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0052 begin');
      expect(dateTime(51)).assertEqual('00:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0052 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_5300
     * @tc.name      testCountdown0053
     * @tc.desc      Verify countdown text for 52 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0053 begin');
      expect(dateTime(52)).assertEqual('00:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0053 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_5400
     * @tc.name      testCountdown0054
     * @tc.desc      Verify countdown text for 53 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0054 begin');
      expect(dateTime(53)).assertEqual('00:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0054 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_5500
     * @tc.name      testCountdown0055
     * @tc.desc      Verify countdown text for 54 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0055 begin');
      expect(dateTime(54)).assertEqual('00:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0055 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_5600
     * @tc.name      testCountdown0056
     * @tc.desc      Verify countdown text for 55 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0056 begin');
      expect(dateTime(55)).assertEqual('00:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0056 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_5700
     * @tc.name      testCountdown0057
     * @tc.desc      Verify countdown text for 56 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0057 begin');
      expect(dateTime(56)).assertEqual('00:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0057 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_5800
     * @tc.name      testCountdown0058
     * @tc.desc      Verify countdown text for 57 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0058 begin');
      expect(dateTime(57)).assertEqual('00:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0058 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_5900
     * @tc.name      testCountdown0059
     * @tc.desc      Verify countdown text for 58 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0059 begin');
      expect(dateTime(58)).assertEqual('00:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0059 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_6000
     * @tc.name      testCountdown0060
     * @tc.desc      Verify countdown text for 59 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0060 begin');
      expect(dateTime(59)).assertEqual('00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0060 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_6100
     * @tc.name      testCountdown0061
     * @tc.desc      Verify countdown text for 60 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0061 begin');
      expect(dateTime(60)).assertEqual('01:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0061 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_6200
     * @tc.name      testCountdown0062
     * @tc.desc      Verify countdown text for 61 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0062 begin');
      expect(dateTime(61)).assertEqual('01:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0062 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_6300
     * @tc.name      testCountdown0063
     * @tc.desc      Verify countdown text for 62 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0063 begin');
      expect(dateTime(62)).assertEqual('01:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0063 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_6400
     * @tc.name      testCountdown0064
     * @tc.desc      Verify countdown text for 63 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0064 begin');
      expect(dateTime(63)).assertEqual('01:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0064 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_6500
     * @tc.name      testCountdown0065
     * @tc.desc      Verify countdown text for 64 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0065 begin');
      expect(dateTime(64)).assertEqual('01:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0065 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_6600
     * @tc.name      testCountdown0066
     * @tc.desc      Verify countdown text for 65 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0066 begin');
      expect(dateTime(65)).assertEqual('01:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0066 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_6700
     * @tc.name      testCountdown0067
     * @tc.desc      Verify countdown text for 66 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0067 begin');
      expect(dateTime(66)).assertEqual('01:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0067 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_6800
     * @tc.name      testCountdown0068
     * @tc.desc      Verify countdown text for 67 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0068 begin');
      expect(dateTime(67)).assertEqual('01:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0068 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_6900
     * @tc.name      testCountdown0069
     * @tc.desc      Verify countdown text for 68 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0069 begin');
      expect(dateTime(68)).assertEqual('01:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0069 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_7000
     * @tc.name      testCountdown0070
     * @tc.desc      Verify countdown text for 69 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0070 begin');
      expect(dateTime(69)).assertEqual('01:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0070 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_7100
     * @tc.name      testCountdown0071
     * @tc.desc      Verify countdown text for 70 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0071 begin');
      expect(dateTime(70)).assertEqual('01:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0071 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_7200
     * @tc.name      testCountdown0072
     * @tc.desc      Verify countdown text for 71 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0072 begin');
      expect(dateTime(71)).assertEqual('01:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0072 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_7300
     * @tc.name      testCountdown0073
     * @tc.desc      Verify countdown text for 72 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0073 begin');
      expect(dateTime(72)).assertEqual('01:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0073 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_7400
     * @tc.name      testCountdown0074
     * @tc.desc      Verify countdown text for 73 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0074 begin');
      expect(dateTime(73)).assertEqual('01:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0074 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_7500
     * @tc.name      testCountdown0075
     * @tc.desc      Verify countdown text for 74 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0075 begin');
      expect(dateTime(74)).assertEqual('01:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0075 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_7600
     * @tc.name      testCountdown0076
     * @tc.desc      Verify countdown text for 75 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0076 begin');
      expect(dateTime(75)).assertEqual('01:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0076 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_7700
     * @tc.name      testCountdown0077
     * @tc.desc      Verify countdown text for 76 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0077 begin');
      expect(dateTime(76)).assertEqual('01:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0077 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_7800
     * @tc.name      testCountdown0078
     * @tc.desc      Verify countdown text for 77 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0078 begin');
      expect(dateTime(77)).assertEqual('01:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0078 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_7900
     * @tc.name      testCountdown0079
     * @tc.desc      Verify countdown text for 78 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0079 begin');
      expect(dateTime(78)).assertEqual('01:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0079 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_8000
     * @tc.name      testCountdown0080
     * @tc.desc      Verify countdown text for 79 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0080 begin');
      expect(dateTime(79)).assertEqual('01:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0080 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_8100
     * @tc.name      testCountdown0081
     * @tc.desc      Verify countdown text for 80 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0081 begin');
      expect(dateTime(80)).assertEqual('01:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0081 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_8200
     * @tc.name      testCountdown0082
     * @tc.desc      Verify countdown text for 81 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0082 begin');
      expect(dateTime(81)).assertEqual('01:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0082 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_8300
     * @tc.name      testCountdown0083
     * @tc.desc      Verify countdown text for 82 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0083 begin');
      expect(dateTime(82)).assertEqual('01:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0083 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_8400
     * @tc.name      testCountdown0084
     * @tc.desc      Verify countdown text for 83 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0084 begin');
      expect(dateTime(83)).assertEqual('01:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0084 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_8500
     * @tc.name      testCountdown0085
     * @tc.desc      Verify countdown text for 84 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0085 begin');
      expect(dateTime(84)).assertEqual('01:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0085 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_8600
     * @tc.name      testCountdown0086
     * @tc.desc      Verify countdown text for 85 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0086 begin');
      expect(dateTime(85)).assertEqual('01:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0086 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_8700
     * @tc.name      testCountdown0087
     * @tc.desc      Verify countdown text for 86 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0087 begin');
      expect(dateTime(86)).assertEqual('01:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0087 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_8800
     * @tc.name      testCountdown0088
     * @tc.desc      Verify countdown text for 87 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0088 begin');
      expect(dateTime(87)).assertEqual('01:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0088 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_8900
     * @tc.name      testCountdown0089
     * @tc.desc      Verify countdown text for 88 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0089 begin');
      expect(dateTime(88)).assertEqual('01:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0089 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTCOUNTP1_9000
     * @tc.name      testCountdown0090
     * @tc.desc      Verify countdown text for 89 seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0090 begin');
      expect(dateTime(89)).assertEqual('01:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0090 end');
    })

  })
}
