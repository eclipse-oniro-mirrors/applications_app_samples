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

export default function DateTimeStabilityPart1Test(): void {
  describe('DateTimeStabilityPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_AVREC_DTSTABP1_0100
     * @tc.name      testCountStable0001
     * @tc.desc      Verify dateTime(0) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountStable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0001 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (dateTime(0) !== '00:00') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0001 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_0200
     * @tc.name      testCountStable0002
     * @tc.desc      Verify dateTime(10) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountStable0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0002 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (dateTime(10) !== '00:10') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0002 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_0300
     * @tc.name      testCountStable0003
     * @tc.desc      Verify dateTime(20) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountStable0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0003 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (dateTime(20) !== '00:20') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0003 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_0400
     * @tc.name      testCountStable0004
     * @tc.desc      Verify dateTime(30) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountStable0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0004 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (dateTime(30) !== '00:30') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0004 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_0500
     * @tc.name      testCountStable0005
     * @tc.desc      Verify dateTime(40) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountStable0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0005 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (dateTime(40) !== '00:40') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0005 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_0600
     * @tc.name      testCountStable0006
     * @tc.desc      Verify dateTime(50) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountStable0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0006 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (dateTime(50) !== '00:50') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0006 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_0700
     * @tc.name      testCountStable0007
     * @tc.desc      Verify dateTime(60) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountStable0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0007 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (dateTime(60) !== '01:00') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0007 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_0800
     * @tc.name      testCountStable0008
     * @tc.desc      Verify dateTime(70) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountStable0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0008 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (dateTime(70) !== '01:10') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0008 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_0900
     * @tc.name      testCountStable0009
     * @tc.desc      Verify dateTime(80) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountStable0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0009 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (dateTime(80) !== '01:20') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0009 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_1000
     * @tc.name      testCountStable0010
     * @tc.desc      Verify dateTime(90) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountStable0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0010 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (dateTime(90) !== '01:30') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountStable0010 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_1100
     * @tc.name      testFillStable0011
     * @tc.desc      Verify fill(0) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillStable0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0011 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.fill(0) !== '00') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0011 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_1200
     * @tc.name      testFillStable0012
     * @tc.desc      Verify fill(10) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillStable0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0012 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.fill(10) !== '10') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0012 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_1300
     * @tc.name      testFillStable0013
     * @tc.desc      Verify fill(20) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillStable0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0013 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.fill(20) !== '20') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0013 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_1400
     * @tc.name      testFillStable0014
     * @tc.desc      Verify fill(30) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillStable0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0014 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.fill(30) !== '30') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0014 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_1500
     * @tc.name      testFillStable0015
     * @tc.desc      Verify fill(40) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillStable0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0015 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.fill(40) !== '40') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0015 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_1600
     * @tc.name      testFillStable0016
     * @tc.desc      Verify fill(50) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillStable0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0016 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.fill(50) !== '50') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0016 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_1700
     * @tc.name      testFillStable0017
     * @tc.desc      Verify fill(60) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillStable0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0017 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.fill(60) !== '60') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0017 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_1800
     * @tc.name      testFillStable0018
     * @tc.desc      Verify fill(70) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillStable0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0018 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.fill(70) !== '70') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0018 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_1900
     * @tc.name      testFillStable0019
     * @tc.desc      Verify fill(80) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillStable0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0019 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.fill(80) !== '80') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0019 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_2000
     * @tc.name      testFillStable0020
     * @tc.desc      Verify fill(90) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFillStable0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0020 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.fill(90) !== '90') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFillStable0020 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_2100
     * @tc.name      testTimeStable0021
     * @tc.desc      Verify concatTime(0, 4, 5) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeStable0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0021 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.concatTime(0, 4, 5) !== '000405') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0021 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_2200
     * @tc.name      testTimeStable0022
     * @tc.desc      Verify concatTime(1, 4, 5) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeStable0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0022 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.concatTime(1, 4, 5) !== '010405') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0022 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_2300
     * @tc.name      testTimeStable0023
     * @tc.desc      Verify concatTime(2, 4, 5) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeStable0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0023 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.concatTime(2, 4, 5) !== '020405') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0023 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_2400
     * @tc.name      testTimeStable0024
     * @tc.desc      Verify concatTime(3, 4, 5) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeStable0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0024 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.concatTime(3, 4, 5) !== '030405') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0024 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_2500
     * @tc.name      testTimeStable0025
     * @tc.desc      Verify concatTime(4, 4, 5) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeStable0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0025 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.concatTime(4, 4, 5) !== '040405') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0025 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_2600
     * @tc.name      testTimeStable0026
     * @tc.desc      Verify concatTime(5, 4, 5) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeStable0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0026 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.concatTime(5, 4, 5) !== '050405') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0026 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_2700
     * @tc.name      testTimeStable0027
     * @tc.desc      Verify concatTime(6, 4, 5) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeStable0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0027 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.concatTime(6, 4, 5) !== '060405') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0027 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_2800
     * @tc.name      testTimeStable0028
     * @tc.desc      Verify concatTime(7, 4, 5) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeStable0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0028 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.concatTime(7, 4, 5) !== '070405') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0028 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_2900
     * @tc.name      testTimeStable0029
     * @tc.desc      Verify concatTime(8, 4, 5) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeStable0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0029 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.concatTime(8, 4, 5) !== '080405') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0029 end');
    })

    /**
     * @tc.number    SUB_AVREC_DTSTABP1_3000
     * @tc.name      testTimeStable0030
     * @tc.desc      Verify concatTime(9, 4, 5) is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTimeStable0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0030 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (util.concatTime(9, 4, 5) !== '090405') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTimeStable0030 end');
    })

  })
}
