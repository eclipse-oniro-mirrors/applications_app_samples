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
import { MediaTools } from '../../../main/ets/common/utils/mediaUtils/MediaTools';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function MediaCountdownMatrixPart1Test(): void {
  describe('MediaCountdownMatrixPart1', () => {

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_0100
     * @tc.name      testCountdown0001
     * @tc.desc      Verify countdown text for 0 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0001 begin');
      expect(MediaTools.msToCountdownTime(0)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0001 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_0200
     * @tc.name      testCountdown0002
     * @tc.desc      Verify countdown text for 1 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0002 begin');
      expect(MediaTools.msToCountdownTime(1)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0002 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_0300
     * @tc.name      testCountdown0003
     * @tc.desc      Verify countdown text for 500 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0003 begin');
      expect(MediaTools.msToCountdownTime(500)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0003 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_0400
     * @tc.name      testCountdown0004
     * @tc.desc      Verify countdown text for 999 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0004 begin');
      expect(MediaTools.msToCountdownTime(999)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0004 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_0500
     * @tc.name      testCountdown0005
     * @tc.desc      Verify countdown text for 1000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0005 begin');
      expect(MediaTools.msToCountdownTime(1000)).assertEqual('00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0005 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_0600
     * @tc.name      testCountdown0006
     * @tc.desc      Verify countdown text for 1500 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0006 begin');
      expect(MediaTools.msToCountdownTime(1500)).assertEqual('00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0006 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_0700
     * @tc.name      testCountdown0007
     * @tc.desc      Verify countdown text for 1999 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0007 begin');
      expect(MediaTools.msToCountdownTime(1999)).assertEqual('00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0007 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_0800
     * @tc.name      testCountdown0008
     * @tc.desc      Verify countdown text for 2000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0008 begin');
      expect(MediaTools.msToCountdownTime(2000)).assertEqual('00:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0008 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_0900
     * @tc.name      testCountdown0009
     * @tc.desc      Verify countdown text for 3000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0009 begin');
      expect(MediaTools.msToCountdownTime(3000)).assertEqual('00:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0009 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_1000
     * @tc.name      testCountdown0010
     * @tc.desc      Verify countdown text for 4000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0010 begin');
      expect(MediaTools.msToCountdownTime(4000)).assertEqual('00:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0010 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_1100
     * @tc.name      testCountdown0011
     * @tc.desc      Verify countdown text for 5000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0011 begin');
      expect(MediaTools.msToCountdownTime(5000)).assertEqual('00:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0011 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_1200
     * @tc.name      testCountdown0012
     * @tc.desc      Verify countdown text for 6000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0012 begin');
      expect(MediaTools.msToCountdownTime(6000)).assertEqual('00:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0012 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_1300
     * @tc.name      testCountdown0013
     * @tc.desc      Verify countdown text for 7000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0013 begin');
      expect(MediaTools.msToCountdownTime(7000)).assertEqual('00:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0013 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_1400
     * @tc.name      testCountdown0014
     * @tc.desc      Verify countdown text for 8000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0014 begin');
      expect(MediaTools.msToCountdownTime(8000)).assertEqual('00:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0014 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_1500
     * @tc.name      testCountdown0015
     * @tc.desc      Verify countdown text for 9000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0015 begin');
      expect(MediaTools.msToCountdownTime(9000)).assertEqual('00:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0015 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_1600
     * @tc.name      testCountdown0016
     * @tc.desc      Verify countdown text for 10000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0016 begin');
      expect(MediaTools.msToCountdownTime(10000)).assertEqual('00:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0016 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_1700
     * @tc.name      testCountdown0017
     * @tc.desc      Verify countdown text for 11000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0017 begin');
      expect(MediaTools.msToCountdownTime(11000)).assertEqual('00:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0017 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_1800
     * @tc.name      testCountdown0018
     * @tc.desc      Verify countdown text for 12000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0018 begin');
      expect(MediaTools.msToCountdownTime(12000)).assertEqual('00:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0018 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_1900
     * @tc.name      testCountdown0019
     * @tc.desc      Verify countdown text for 13000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0019 begin');
      expect(MediaTools.msToCountdownTime(13000)).assertEqual('00:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0019 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_2000
     * @tc.name      testCountdown0020
     * @tc.desc      Verify countdown text for 14000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0020 begin');
      expect(MediaTools.msToCountdownTime(14000)).assertEqual('00:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0020 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_2100
     * @tc.name      testCountdown0021
     * @tc.desc      Verify countdown text for 15000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0021 begin');
      expect(MediaTools.msToCountdownTime(15000)).assertEqual('00:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0021 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_2200
     * @tc.name      testCountdown0022
     * @tc.desc      Verify countdown text for 16000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0022 begin');
      expect(MediaTools.msToCountdownTime(16000)).assertEqual('00:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0022 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_2300
     * @tc.name      testCountdown0023
     * @tc.desc      Verify countdown text for 17000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0023 begin');
      expect(MediaTools.msToCountdownTime(17000)).assertEqual('00:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0023 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_2400
     * @tc.name      testCountdown0024
     * @tc.desc      Verify countdown text for 18000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0024 begin');
      expect(MediaTools.msToCountdownTime(18000)).assertEqual('00:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0024 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_2500
     * @tc.name      testCountdown0025
     * @tc.desc      Verify countdown text for 19000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0025 begin');
      expect(MediaTools.msToCountdownTime(19000)).assertEqual('00:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0025 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_2600
     * @tc.name      testCountdown0026
     * @tc.desc      Verify countdown text for 20000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0026 begin');
      expect(MediaTools.msToCountdownTime(20000)).assertEqual('00:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0026 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_2700
     * @tc.name      testCountdown0027
     * @tc.desc      Verify countdown text for 21000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0027 begin');
      expect(MediaTools.msToCountdownTime(21000)).assertEqual('00:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0027 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_2800
     * @tc.name      testCountdown0028
     * @tc.desc      Verify countdown text for 22000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0028 begin');
      expect(MediaTools.msToCountdownTime(22000)).assertEqual('00:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0028 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_2900
     * @tc.name      testCountdown0029
     * @tc.desc      Verify countdown text for 23000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0029 begin');
      expect(MediaTools.msToCountdownTime(23000)).assertEqual('00:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0029 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_3000
     * @tc.name      testCountdown0030
     * @tc.desc      Verify countdown text for 24000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0030 begin');
      expect(MediaTools.msToCountdownTime(24000)).assertEqual('00:24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0030 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_3100
     * @tc.name      testCountdown0031
     * @tc.desc      Verify countdown text for 25000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0031 begin');
      expect(MediaTools.msToCountdownTime(25000)).assertEqual('00:25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0031 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_3200
     * @tc.name      testCountdown0032
     * @tc.desc      Verify countdown text for 26000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0032 begin');
      expect(MediaTools.msToCountdownTime(26000)).assertEqual('00:26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0032 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_3300
     * @tc.name      testCountdown0033
     * @tc.desc      Verify countdown text for 27000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0033 begin');
      expect(MediaTools.msToCountdownTime(27000)).assertEqual('00:27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0033 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_3400
     * @tc.name      testCountdown0034
     * @tc.desc      Verify countdown text for 28000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0034 begin');
      expect(MediaTools.msToCountdownTime(28000)).assertEqual('00:28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0034 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_3500
     * @tc.name      testCountdown0035
     * @tc.desc      Verify countdown text for 29000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0035 begin');
      expect(MediaTools.msToCountdownTime(29000)).assertEqual('00:29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0035 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_3600
     * @tc.name      testCountdown0036
     * @tc.desc      Verify countdown text for 30000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0036 begin');
      expect(MediaTools.msToCountdownTime(30000)).assertEqual('00:30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0036 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_3700
     * @tc.name      testCountdown0037
     * @tc.desc      Verify countdown text for 31000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0037 begin');
      expect(MediaTools.msToCountdownTime(31000)).assertEqual('00:31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0037 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_3800
     * @tc.name      testCountdown0038
     * @tc.desc      Verify countdown text for 32000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0038 begin');
      expect(MediaTools.msToCountdownTime(32000)).assertEqual('00:32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0038 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_3900
     * @tc.name      testCountdown0039
     * @tc.desc      Verify countdown text for 33000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0039 begin');
      expect(MediaTools.msToCountdownTime(33000)).assertEqual('00:33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0039 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_4000
     * @tc.name      testCountdown0040
     * @tc.desc      Verify countdown text for 34000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0040 begin');
      expect(MediaTools.msToCountdownTime(34000)).assertEqual('00:34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0040 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_4100
     * @tc.name      testCountdown0041
     * @tc.desc      Verify countdown text for 35000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0041 begin');
      expect(MediaTools.msToCountdownTime(35000)).assertEqual('00:35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0041 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_4200
     * @tc.name      testCountdown0042
     * @tc.desc      Verify countdown text for 36000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0042 begin');
      expect(MediaTools.msToCountdownTime(36000)).assertEqual('00:36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0042 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_4300
     * @tc.name      testCountdown0043
     * @tc.desc      Verify countdown text for 37000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0043 begin');
      expect(MediaTools.msToCountdownTime(37000)).assertEqual('00:37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0043 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_4400
     * @tc.name      testCountdown0044
     * @tc.desc      Verify countdown text for 38000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0044 begin');
      expect(MediaTools.msToCountdownTime(38000)).assertEqual('00:38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0044 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_4500
     * @tc.name      testCountdown0045
     * @tc.desc      Verify countdown text for 39000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0045 begin');
      expect(MediaTools.msToCountdownTime(39000)).assertEqual('00:39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0045 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_4600
     * @tc.name      testCountdown0046
     * @tc.desc      Verify countdown text for 40000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0046 begin');
      expect(MediaTools.msToCountdownTime(40000)).assertEqual('00:40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0046 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_4700
     * @tc.name      testCountdown0047
     * @tc.desc      Verify countdown text for 41000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0047 begin');
      expect(MediaTools.msToCountdownTime(41000)).assertEqual('00:41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0047 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_4800
     * @tc.name      testCountdown0048
     * @tc.desc      Verify countdown text for 42000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0048 begin');
      expect(MediaTools.msToCountdownTime(42000)).assertEqual('00:42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0048 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_4900
     * @tc.name      testCountdown0049
     * @tc.desc      Verify countdown text for 43000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0049 begin');
      expect(MediaTools.msToCountdownTime(43000)).assertEqual('00:43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0049 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_5000
     * @tc.name      testCountdown0050
     * @tc.desc      Verify countdown text for 44000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0050 begin');
      expect(MediaTools.msToCountdownTime(44000)).assertEqual('00:44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0050 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_5100
     * @tc.name      testCountdown0051
     * @tc.desc      Verify countdown text for 45000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0051 begin');
      expect(MediaTools.msToCountdownTime(45000)).assertEqual('00:45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0051 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_5200
     * @tc.name      testCountdown0052
     * @tc.desc      Verify countdown text for 46000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0052 begin');
      expect(MediaTools.msToCountdownTime(46000)).assertEqual('00:46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0052 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_5300
     * @tc.name      testCountdown0053
     * @tc.desc      Verify countdown text for 47000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0053 begin');
      expect(MediaTools.msToCountdownTime(47000)).assertEqual('00:47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0053 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_5400
     * @tc.name      testCountdown0054
     * @tc.desc      Verify countdown text for 48000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0054 begin');
      expect(MediaTools.msToCountdownTime(48000)).assertEqual('00:48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0054 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_5500
     * @tc.name      testCountdown0055
     * @tc.desc      Verify countdown text for 49000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0055 begin');
      expect(MediaTools.msToCountdownTime(49000)).assertEqual('00:49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0055 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_5600
     * @tc.name      testCountdown0056
     * @tc.desc      Verify countdown text for 50000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0056 begin');
      expect(MediaTools.msToCountdownTime(50000)).assertEqual('00:50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0056 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_5700
     * @tc.name      testCountdown0057
     * @tc.desc      Verify countdown text for 51000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0057 begin');
      expect(MediaTools.msToCountdownTime(51000)).assertEqual('00:51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0057 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_5800
     * @tc.name      testCountdown0058
     * @tc.desc      Verify countdown text for 52000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0058 begin');
      expect(MediaTools.msToCountdownTime(52000)).assertEqual('00:52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0058 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_5900
     * @tc.name      testCountdown0059
     * @tc.desc      Verify countdown text for 53000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0059 begin');
      expect(MediaTools.msToCountdownTime(53000)).assertEqual('00:53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0059 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_6000
     * @tc.name      testCountdown0060
     * @tc.desc      Verify countdown text for 54000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0060 begin');
      expect(MediaTools.msToCountdownTime(54000)).assertEqual('00:54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0060 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_6100
     * @tc.name      testCountdown0061
     * @tc.desc      Verify countdown text for 55000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0061 begin');
      expect(MediaTools.msToCountdownTime(55000)).assertEqual('00:55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0061 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_6200
     * @tc.name      testCountdown0062
     * @tc.desc      Verify countdown text for 56000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0062 begin');
      expect(MediaTools.msToCountdownTime(56000)).assertEqual('00:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0062 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_6300
     * @tc.name      testCountdown0063
     * @tc.desc      Verify countdown text for 57000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0063 begin');
      expect(MediaTools.msToCountdownTime(57000)).assertEqual('00:57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0063 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_6400
     * @tc.name      testCountdown0064
     * @tc.desc      Verify countdown text for 58000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0064 begin');
      expect(MediaTools.msToCountdownTime(58000)).assertEqual('00:58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0064 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_6500
     * @tc.name      testCountdown0065
     * @tc.desc      Verify countdown text for 59000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0065 begin');
      expect(MediaTools.msToCountdownTime(59000)).assertEqual('00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0065 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_6600
     * @tc.name      testCountdown0066
     * @tc.desc      Verify countdown text for 59999 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0066 begin');
      expect(MediaTools.msToCountdownTime(59999)).assertEqual('00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0066 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_6700
     * @tc.name      testCountdown0067
     * @tc.desc      Verify countdown text for 60000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0067 begin');
      expect(MediaTools.msToCountdownTime(60000)).assertEqual('01:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0067 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_6800
     * @tc.name      testCountdown0068
     * @tc.desc      Verify countdown text for 61000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0068 begin');
      expect(MediaTools.msToCountdownTime(61000)).assertEqual('01:01');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0068 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_6900
     * @tc.name      testCountdown0069
     * @tc.desc      Verify countdown text for 62000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0069 begin');
      expect(MediaTools.msToCountdownTime(62000)).assertEqual('01:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0069 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_7000
     * @tc.name      testCountdown0070
     * @tc.desc      Verify countdown text for 63000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0070 begin');
      expect(MediaTools.msToCountdownTime(63000)).assertEqual('01:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0070 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_7100
     * @tc.name      testCountdown0071
     * @tc.desc      Verify countdown text for 64000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0071 begin');
      expect(MediaTools.msToCountdownTime(64000)).assertEqual('01:04');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0071 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_7200
     * @tc.name      testCountdown0072
     * @tc.desc      Verify countdown text for 65000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0072 begin');
      expect(MediaTools.msToCountdownTime(65000)).assertEqual('01:05');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0072 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_7300
     * @tc.name      testCountdown0073
     * @tc.desc      Verify countdown text for 66000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0073 begin');
      expect(MediaTools.msToCountdownTime(66000)).assertEqual('01:06');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0073 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_7400
     * @tc.name      testCountdown0074
     * @tc.desc      Verify countdown text for 67000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0074 begin');
      expect(MediaTools.msToCountdownTime(67000)).assertEqual('01:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0074 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_7500
     * @tc.name      testCountdown0075
     * @tc.desc      Verify countdown text for 68000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0075 begin');
      expect(MediaTools.msToCountdownTime(68000)).assertEqual('01:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0075 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_7600
     * @tc.name      testCountdown0076
     * @tc.desc      Verify countdown text for 69000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0076 begin');
      expect(MediaTools.msToCountdownTime(69000)).assertEqual('01:09');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0076 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_7700
     * @tc.name      testCountdown0077
     * @tc.desc      Verify countdown text for 70000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0077 begin');
      expect(MediaTools.msToCountdownTime(70000)).assertEqual('01:10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0077 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_7800
     * @tc.name      testCountdown0078
     * @tc.desc      Verify countdown text for 71000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0078 begin');
      expect(MediaTools.msToCountdownTime(71000)).assertEqual('01:11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0078 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_7900
     * @tc.name      testCountdown0079
     * @tc.desc      Verify countdown text for 72000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0079 begin');
      expect(MediaTools.msToCountdownTime(72000)).assertEqual('01:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0079 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_8000
     * @tc.name      testCountdown0080
     * @tc.desc      Verify countdown text for 73000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0080 begin');
      expect(MediaTools.msToCountdownTime(73000)).assertEqual('01:13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0080 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_8100
     * @tc.name      testCountdown0081
     * @tc.desc      Verify countdown text for 74000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0081 begin');
      expect(MediaTools.msToCountdownTime(74000)).assertEqual('01:14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0081 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_8200
     * @tc.name      testCountdown0082
     * @tc.desc      Verify countdown text for 75000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0082 begin');
      expect(MediaTools.msToCountdownTime(75000)).assertEqual('01:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0082 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_8300
     * @tc.name      testCountdown0083
     * @tc.desc      Verify countdown text for 76000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0083 begin');
      expect(MediaTools.msToCountdownTime(76000)).assertEqual('01:16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0083 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_8400
     * @tc.name      testCountdown0084
     * @tc.desc      Verify countdown text for 77000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0084 begin');
      expect(MediaTools.msToCountdownTime(77000)).assertEqual('01:17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0084 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_8500
     * @tc.name      testCountdown0085
     * @tc.desc      Verify countdown text for 78000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0085 begin');
      expect(MediaTools.msToCountdownTime(78000)).assertEqual('01:18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0085 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_8600
     * @tc.name      testCountdown0086
     * @tc.desc      Verify countdown text for 79000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0086 begin');
      expect(MediaTools.msToCountdownTime(79000)).assertEqual('01:19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0086 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_8700
     * @tc.name      testCountdown0087
     * @tc.desc      Verify countdown text for 80000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0087 begin');
      expect(MediaTools.msToCountdownTime(80000)).assertEqual('01:20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0087 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_8800
     * @tc.name      testCountdown0088
     * @tc.desc      Verify countdown text for 81000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0088 begin');
      expect(MediaTools.msToCountdownTime(81000)).assertEqual('01:21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0088 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_8900
     * @tc.name      testCountdown0089
     * @tc.desc      Verify countdown text for 82000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0089 begin');
      expect(MediaTools.msToCountdownTime(82000)).assertEqual('01:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0089 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_COUNTDOWNP1_9000
     * @tc.name      testCountdown0090
     * @tc.desc      Verify countdown text for 83000 milliseconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountdown0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0090 begin');
      expect(MediaTools.msToCountdownTime(83000)).assertEqual('01:23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdown0090 end');
    })

  })
}
