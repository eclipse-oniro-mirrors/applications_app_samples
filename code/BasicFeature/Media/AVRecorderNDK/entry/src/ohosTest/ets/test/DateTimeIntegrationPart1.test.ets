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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import DateTimeUtil, { dateTime } from '../../../main/ets/utils/DateTimeUtil';

const util: DateTimeUtil = new DateTimeUtil();

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AVRecorder]';

export default function DateTimeIntegrationPart1Test(): void {
  describe('DateTimeIntegrationPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_AVREC_DTINTP1_0100
     * @tc.name      testHourWrap0001
     * @tc.desc      Verify dateTime(0) equals dateTime(3600) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0001 begin');
      expect(dateTime(0)).assertEqual(dateTime(3600));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0001 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_0200
     * @tc.name      testHourWrap0002
     * @tc.desc      Verify dateTime(1) equals dateTime(3601) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0002 begin');
      expect(dateTime(1)).assertEqual(dateTime(3601));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0002 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_0300
     * @tc.name      testHourWrap0003
     * @tc.desc      Verify dateTime(2) equals dateTime(3602) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0003 begin');
      expect(dateTime(2)).assertEqual(dateTime(3602));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0003 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_0400
     * @tc.name      testHourWrap0004
     * @tc.desc      Verify dateTime(3) equals dateTime(3603) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0004 begin');
      expect(dateTime(3)).assertEqual(dateTime(3603));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0004 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_0500
     * @tc.name      testHourWrap0005
     * @tc.desc      Verify dateTime(4) equals dateTime(3604) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0005 begin');
      expect(dateTime(4)).assertEqual(dateTime(3604));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0005 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_0600
     * @tc.name      testHourWrap0006
     * @tc.desc      Verify dateTime(5) equals dateTime(3605) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0006 begin');
      expect(dateTime(5)).assertEqual(dateTime(3605));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0006 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_0700
     * @tc.name      testHourWrap0007
     * @tc.desc      Verify dateTime(6) equals dateTime(3606) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0007 begin');
      expect(dateTime(6)).assertEqual(dateTime(3606));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0007 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_0800
     * @tc.name      testHourWrap0008
     * @tc.desc      Verify dateTime(7) equals dateTime(3607) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0008 begin');
      expect(dateTime(7)).assertEqual(dateTime(3607));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0008 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_0900
     * @tc.name      testHourWrap0009
     * @tc.desc      Verify dateTime(8) equals dateTime(3608) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0009 begin');
      expect(dateTime(8)).assertEqual(dateTime(3608));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0009 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_1000
     * @tc.name      testHourWrap0010
     * @tc.desc      Verify dateTime(9) equals dateTime(3609) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0010 begin');
      expect(dateTime(9)).assertEqual(dateTime(3609));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0010 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_1100
     * @tc.name      testHourWrap0011
     * @tc.desc      Verify dateTime(10) equals dateTime(3610) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0011 begin');
      expect(dateTime(10)).assertEqual(dateTime(3610));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0011 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_1200
     * @tc.name      testHourWrap0012
     * @tc.desc      Verify dateTime(11) equals dateTime(3611) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0012 begin');
      expect(dateTime(11)).assertEqual(dateTime(3611));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0012 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_1300
     * @tc.name      testHourWrap0013
     * @tc.desc      Verify dateTime(12) equals dateTime(3612) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0013 begin');
      expect(dateTime(12)).assertEqual(dateTime(3612));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0013 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_1400
     * @tc.name      testHourWrap0014
     * @tc.desc      Verify dateTime(13) equals dateTime(3613) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0014 begin');
      expect(dateTime(13)).assertEqual(dateTime(3613));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0014 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_1500
     * @tc.name      testHourWrap0015
     * @tc.desc      Verify dateTime(14) equals dateTime(3614) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0015 begin');
      expect(dateTime(14)).assertEqual(dateTime(3614));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0015 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_1600
     * @tc.name      testHourWrap0016
     * @tc.desc      Verify dateTime(15) equals dateTime(3615) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0016 begin');
      expect(dateTime(15)).assertEqual(dateTime(3615));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0016 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_1700
     * @tc.name      testHourWrap0017
     * @tc.desc      Verify dateTime(16) equals dateTime(3616) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0017 begin');
      expect(dateTime(16)).assertEqual(dateTime(3616));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0017 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_1800
     * @tc.name      testHourWrap0018
     * @tc.desc      Verify dateTime(17) equals dateTime(3617) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0018 begin');
      expect(dateTime(17)).assertEqual(dateTime(3617));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0018 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_1900
     * @tc.name      testHourWrap0019
     * @tc.desc      Verify dateTime(18) equals dateTime(3618) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0019 begin');
      expect(dateTime(18)).assertEqual(dateTime(3618));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0019 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_2000
     * @tc.name      testHourWrap0020
     * @tc.desc      Verify dateTime(19) equals dateTime(3619) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0020 begin');
      expect(dateTime(19)).assertEqual(dateTime(3619));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0020 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_2100
     * @tc.name      testHourWrap0021
     * @tc.desc      Verify dateTime(20) equals dateTime(3620) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0021 begin');
      expect(dateTime(20)).assertEqual(dateTime(3620));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0021 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_2200
     * @tc.name      testHourWrap0022
     * @tc.desc      Verify dateTime(21) equals dateTime(3621) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0022 begin');
      expect(dateTime(21)).assertEqual(dateTime(3621));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0022 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_2300
     * @tc.name      testHourWrap0023
     * @tc.desc      Verify dateTime(22) equals dateTime(3622) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0023 begin');
      expect(dateTime(22)).assertEqual(dateTime(3622));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0023 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_2400
     * @tc.name      testHourWrap0024
     * @tc.desc      Verify dateTime(23) equals dateTime(3623) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0024 begin');
      expect(dateTime(23)).assertEqual(dateTime(3623));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0024 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_2500
     * @tc.name      testHourWrap0025
     * @tc.desc      Verify dateTime(24) equals dateTime(3624) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0025 begin');
      expect(dateTime(24)).assertEqual(dateTime(3624));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0025 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_2600
     * @tc.name      testHourWrap0026
     * @tc.desc      Verify dateTime(25) equals dateTime(3625) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0026 begin');
      expect(dateTime(25)).assertEqual(dateTime(3625));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0026 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_2700
     * @tc.name      testHourWrap0027
     * @tc.desc      Verify dateTime(26) equals dateTime(3626) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0027 begin');
      expect(dateTime(26)).assertEqual(dateTime(3626));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0027 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_2800
     * @tc.name      testHourWrap0028
     * @tc.desc      Verify dateTime(27) equals dateTime(3627) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0028 begin');
      expect(dateTime(27)).assertEqual(dateTime(3627));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0028 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_2900
     * @tc.name      testHourWrap0029
     * @tc.desc      Verify dateTime(28) equals dateTime(3628) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0029 begin');
      expect(dateTime(28)).assertEqual(dateTime(3628));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0029 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_3000
     * @tc.name      testHourWrap0030
     * @tc.desc      Verify dateTime(29) equals dateTime(3629) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0030 begin');
      expect(dateTime(29)).assertEqual(dateTime(3629));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0030 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_3100
     * @tc.name      testHourWrap0031
     * @tc.desc      Verify dateTime(30) equals dateTime(3630) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0031 begin');
      expect(dateTime(30)).assertEqual(dateTime(3630));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0031 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_3200
     * @tc.name      testHourWrap0032
     * @tc.desc      Verify dateTime(31) equals dateTime(3631) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0032 begin');
      expect(dateTime(31)).assertEqual(dateTime(3631));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0032 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_3300
     * @tc.name      testHourWrap0033
     * @tc.desc      Verify dateTime(32) equals dateTime(3632) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0033 begin');
      expect(dateTime(32)).assertEqual(dateTime(3632));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0033 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_3400
     * @tc.name      testHourWrap0034
     * @tc.desc      Verify dateTime(33) equals dateTime(3633) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0034 begin');
      expect(dateTime(33)).assertEqual(dateTime(3633));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0034 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_3500
     * @tc.name      testHourWrap0035
     * @tc.desc      Verify dateTime(34) equals dateTime(3634) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0035 begin');
      expect(dateTime(34)).assertEqual(dateTime(3634));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0035 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_3600
     * @tc.name      testHourWrap0036
     * @tc.desc      Verify dateTime(35) equals dateTime(3635) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0036 begin');
      expect(dateTime(35)).assertEqual(dateTime(3635));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0036 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_3700
     * @tc.name      testHourWrap0037
     * @tc.desc      Verify dateTime(36) equals dateTime(3636) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0037 begin');
      expect(dateTime(36)).assertEqual(dateTime(3636));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0037 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_3800
     * @tc.name      testHourWrap0038
     * @tc.desc      Verify dateTime(37) equals dateTime(3637) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0038 begin');
      expect(dateTime(37)).assertEqual(dateTime(3637));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0038 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_3900
     * @tc.name      testHourWrap0039
     * @tc.desc      Verify dateTime(38) equals dateTime(3638) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0039 begin');
      expect(dateTime(38)).assertEqual(dateTime(3638));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0039 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_4000
     * @tc.name      testHourWrap0040
     * @tc.desc      Verify dateTime(39) equals dateTime(3639) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0040 begin');
      expect(dateTime(39)).assertEqual(dateTime(3639));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0040 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_4100
     * @tc.name      testHourWrap0041
     * @tc.desc      Verify dateTime(40) equals dateTime(3640) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0041 begin');
      expect(dateTime(40)).assertEqual(dateTime(3640));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0041 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_4200
     * @tc.name      testHourWrap0042
     * @tc.desc      Verify dateTime(41) equals dateTime(3641) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0042 begin');
      expect(dateTime(41)).assertEqual(dateTime(3641));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0042 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_4300
     * @tc.name      testHourWrap0043
     * @tc.desc      Verify dateTime(42) equals dateTime(3642) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0043 begin');
      expect(dateTime(42)).assertEqual(dateTime(3642));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0043 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_4400
     * @tc.name      testHourWrap0044
     * @tc.desc      Verify dateTime(43) equals dateTime(3643) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0044 begin');
      expect(dateTime(43)).assertEqual(dateTime(3643));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0044 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_4500
     * @tc.name      testHourWrap0045
     * @tc.desc      Verify dateTime(44) equals dateTime(3644) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0045 begin');
      expect(dateTime(44)).assertEqual(dateTime(3644));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0045 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_4600
     * @tc.name      testHourWrap0046
     * @tc.desc      Verify dateTime(45) equals dateTime(3645) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0046 begin');
      expect(dateTime(45)).assertEqual(dateTime(3645));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0046 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_4700
     * @tc.name      testHourWrap0047
     * @tc.desc      Verify dateTime(46) equals dateTime(3646) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0047 begin');
      expect(dateTime(46)).assertEqual(dateTime(3646));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0047 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_4800
     * @tc.name      testHourWrap0048
     * @tc.desc      Verify dateTime(47) equals dateTime(3647) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0048 begin');
      expect(dateTime(47)).assertEqual(dateTime(3647));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0048 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_4900
     * @tc.name      testHourWrap0049
     * @tc.desc      Verify dateTime(48) equals dateTime(3648) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0049 begin');
      expect(dateTime(48)).assertEqual(dateTime(3648));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0049 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_5000
     * @tc.name      testHourWrap0050
     * @tc.desc      Verify dateTime(49) equals dateTime(3649) after one-hour wrap.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHourWrap0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0050 begin');
      expect(dateTime(49)).assertEqual(dateTime(3649));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHourWrap0050 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_5100
     * @tc.name      testCompose0051
     * @tc.desc      Verify dateTime(0) matches fill(0) + ":" + fill(0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0051 begin');
      expect(dateTime(0)).assertEqual(util.fill(0) + ':' + util.fill(0));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0051 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_5200
     * @tc.name      testCompose0052
     * @tc.desc      Verify dateTime(67) matches fill(1) + ":" + fill(7).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0052 begin');
      expect(dateTime(67)).assertEqual(util.fill(1) + ':' + util.fill(7));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0052 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_5300
     * @tc.name      testCompose0053
     * @tc.desc      Verify dateTime(134) matches fill(2) + ":" + fill(14).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0053 begin');
      expect(dateTime(134)).assertEqual(util.fill(2) + ':' + util.fill(14));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0053 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_5400
     * @tc.name      testCompose0054
     * @tc.desc      Verify dateTime(201) matches fill(3) + ":" + fill(21).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0054 begin');
      expect(dateTime(201)).assertEqual(util.fill(3) + ':' + util.fill(21));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0054 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_5500
     * @tc.name      testCompose0055
     * @tc.desc      Verify dateTime(268) matches fill(4) + ":" + fill(28).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0055 begin');
      expect(dateTime(268)).assertEqual(util.fill(4) + ':' + util.fill(28));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0055 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_5600
     * @tc.name      testCompose0056
     * @tc.desc      Verify dateTime(335) matches fill(5) + ":" + fill(35).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0056 begin');
      expect(dateTime(335)).assertEqual(util.fill(5) + ':' + util.fill(35));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0056 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_5700
     * @tc.name      testCompose0057
     * @tc.desc      Verify dateTime(402) matches fill(6) + ":" + fill(42).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0057 begin');
      expect(dateTime(402)).assertEqual(util.fill(6) + ':' + util.fill(42));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0057 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_5800
     * @tc.name      testCompose0058
     * @tc.desc      Verify dateTime(469) matches fill(7) + ":" + fill(49).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0058 begin');
      expect(dateTime(469)).assertEqual(util.fill(7) + ':' + util.fill(49));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0058 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_5900
     * @tc.name      testCompose0059
     * @tc.desc      Verify dateTime(536) matches fill(8) + ":" + fill(56).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0059 begin');
      expect(dateTime(536)).assertEqual(util.fill(8) + ':' + util.fill(56));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0059 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_6000
     * @tc.name      testCompose0060
     * @tc.desc      Verify dateTime(543) matches fill(9) + ":" + fill(3).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0060 begin');
      expect(dateTime(543)).assertEqual(util.fill(9) + ':' + util.fill(3));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0060 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_6100
     * @tc.name      testCompose0061
     * @tc.desc      Verify dateTime(610) matches fill(10) + ":" + fill(10).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0061 begin');
      expect(dateTime(610)).assertEqual(util.fill(10) + ':' + util.fill(10));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0061 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_6200
     * @tc.name      testCompose0062
     * @tc.desc      Verify dateTime(677) matches fill(11) + ":" + fill(17).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0062 begin');
      expect(dateTime(677)).assertEqual(util.fill(11) + ':' + util.fill(17));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0062 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_6300
     * @tc.name      testCompose0063
     * @tc.desc      Verify dateTime(744) matches fill(12) + ":" + fill(24).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0063 begin');
      expect(dateTime(744)).assertEqual(util.fill(12) + ':' + util.fill(24));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0063 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_6400
     * @tc.name      testCompose0064
     * @tc.desc      Verify dateTime(811) matches fill(13) + ":" + fill(31).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0064 begin');
      expect(dateTime(811)).assertEqual(util.fill(13) + ':' + util.fill(31));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0064 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_6500
     * @tc.name      testCompose0065
     * @tc.desc      Verify dateTime(878) matches fill(14) + ":" + fill(38).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0065 begin');
      expect(dateTime(878)).assertEqual(util.fill(14) + ':' + util.fill(38));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0065 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_6600
     * @tc.name      testCompose0066
     * @tc.desc      Verify dateTime(945) matches fill(15) + ":" + fill(45).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0066 begin');
      expect(dateTime(945)).assertEqual(util.fill(15) + ':' + util.fill(45));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0066 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_6700
     * @tc.name      testCompose0067
     * @tc.desc      Verify dateTime(1012) matches fill(16) + ":" + fill(52).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0067 begin');
      expect(dateTime(1012)).assertEqual(util.fill(16) + ':' + util.fill(52));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0067 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_6800
     * @tc.name      testCompose0068
     * @tc.desc      Verify dateTime(1079) matches fill(17) + ":" + fill(59).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0068 begin');
      expect(dateTime(1079)).assertEqual(util.fill(17) + ':' + util.fill(59));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0068 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_6900
     * @tc.name      testCompose0069
     * @tc.desc      Verify dateTime(1086) matches fill(18) + ":" + fill(6).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0069 begin');
      expect(dateTime(1086)).assertEqual(util.fill(18) + ':' + util.fill(6));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0069 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_7000
     * @tc.name      testCompose0070
     * @tc.desc      Verify dateTime(1153) matches fill(19) + ":" + fill(13).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0070 begin');
      expect(dateTime(1153)).assertEqual(util.fill(19) + ':' + util.fill(13));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0070 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_7100
     * @tc.name      testCompose0071
     * @tc.desc      Verify dateTime(1220) matches fill(20) + ":" + fill(20).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0071 begin');
      expect(dateTime(1220)).assertEqual(util.fill(20) + ':' + util.fill(20));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0071 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_7200
     * @tc.name      testCompose0072
     * @tc.desc      Verify dateTime(1287) matches fill(21) + ":" + fill(27).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0072 begin');
      expect(dateTime(1287)).assertEqual(util.fill(21) + ':' + util.fill(27));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0072 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_7300
     * @tc.name      testCompose0073
     * @tc.desc      Verify dateTime(1354) matches fill(22) + ":" + fill(34).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0073 begin');
      expect(dateTime(1354)).assertEqual(util.fill(22) + ':' + util.fill(34));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0073 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_7400
     * @tc.name      testCompose0074
     * @tc.desc      Verify dateTime(1421) matches fill(23) + ":" + fill(41).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0074 begin');
      expect(dateTime(1421)).assertEqual(util.fill(23) + ':' + util.fill(41));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0074 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_7500
     * @tc.name      testCompose0075
     * @tc.desc      Verify dateTime(1488) matches fill(24) + ":" + fill(48).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0075 begin');
      expect(dateTime(1488)).assertEqual(util.fill(24) + ':' + util.fill(48));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0075 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_7600
     * @tc.name      testCompose0076
     * @tc.desc      Verify dateTime(1555) matches fill(25) + ":" + fill(55).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0076 begin');
      expect(dateTime(1555)).assertEqual(util.fill(25) + ':' + util.fill(55));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0076 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_7700
     * @tc.name      testCompose0077
     * @tc.desc      Verify dateTime(1562) matches fill(26) + ":" + fill(2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0077 begin');
      expect(dateTime(1562)).assertEqual(util.fill(26) + ':' + util.fill(2));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0077 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_7800
     * @tc.name      testCompose0078
     * @tc.desc      Verify dateTime(1629) matches fill(27) + ":" + fill(9).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0078 begin');
      expect(dateTime(1629)).assertEqual(util.fill(27) + ':' + util.fill(9));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0078 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_7900
     * @tc.name      testCompose0079
     * @tc.desc      Verify dateTime(1696) matches fill(28) + ":" + fill(16).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0079 begin');
      expect(dateTime(1696)).assertEqual(util.fill(28) + ':' + util.fill(16));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0079 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_8000
     * @tc.name      testCompose0080
     * @tc.desc      Verify dateTime(1763) matches fill(29) + ":" + fill(23).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0080 begin');
      expect(dateTime(1763)).assertEqual(util.fill(29) + ':' + util.fill(23));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0080 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_8100
     * @tc.name      testCompose0081
     * @tc.desc      Verify dateTime(1830) matches fill(30) + ":" + fill(30).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0081 begin');
      expect(dateTime(1830)).assertEqual(util.fill(30) + ':' + util.fill(30));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0081 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_8200
     * @tc.name      testCompose0082
     * @tc.desc      Verify dateTime(1897) matches fill(31) + ":" + fill(37).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0082 begin');
      expect(dateTime(1897)).assertEqual(util.fill(31) + ':' + util.fill(37));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0082 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_8300
     * @tc.name      testCompose0083
     * @tc.desc      Verify dateTime(1964) matches fill(32) + ":" + fill(44).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0083 begin');
      expect(dateTime(1964)).assertEqual(util.fill(32) + ':' + util.fill(44));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0083 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_8400
     * @tc.name      testCompose0084
     * @tc.desc      Verify dateTime(2031) matches fill(33) + ":" + fill(51).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0084 begin');
      expect(dateTime(2031)).assertEqual(util.fill(33) + ':' + util.fill(51));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0084 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_8500
     * @tc.name      testCompose0085
     * @tc.desc      Verify dateTime(2098) matches fill(34) + ":" + fill(58).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0085 begin');
      expect(dateTime(2098)).assertEqual(util.fill(34) + ':' + util.fill(58));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0085 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_8600
     * @tc.name      testCompose0086
     * @tc.desc      Verify dateTime(2105) matches fill(35) + ":" + fill(5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0086 begin');
      expect(dateTime(2105)).assertEqual(util.fill(35) + ':' + util.fill(5));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0086 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_8700
     * @tc.name      testCompose0087
     * @tc.desc      Verify dateTime(2172) matches fill(36) + ":" + fill(12).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0087 begin');
      expect(dateTime(2172)).assertEqual(util.fill(36) + ':' + util.fill(12));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0087 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_8800
     * @tc.name      testCompose0088
     * @tc.desc      Verify dateTime(2239) matches fill(37) + ":" + fill(19).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0088 begin');
      expect(dateTime(2239)).assertEqual(util.fill(37) + ':' + util.fill(19));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0088 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_8900
     * @tc.name      testCompose0089
     * @tc.desc      Verify dateTime(2306) matches fill(38) + ":" + fill(26).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0089 begin');
      expect(dateTime(2306)).assertEqual(util.fill(38) + ':' + util.fill(26));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0089 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTINTP1_9000
     * @tc.name      testCompose0090
     * @tc.desc      Verify dateTime(2373) matches fill(39) + ":" + fill(33).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCompose0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0090 begin');
      expect(dateTime(2373)).assertEqual(util.fill(39) + ':' + util.fill(33));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompose0090 end');
    })

  })
}
