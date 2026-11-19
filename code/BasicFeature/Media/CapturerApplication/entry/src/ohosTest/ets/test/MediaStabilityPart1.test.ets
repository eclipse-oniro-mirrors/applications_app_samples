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
import { MediaTools } from '../../../main/ets/common/utils/mediaUtils/MediaTools';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CapturerApplication]';

export default function MediaStabilityPart1Test(): void {
  describe('MediaStabilityPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_CAPTURER_STABP1_0100
     * @tc.name      testByteStable0001
     * @tc.desc      Verify byte conversion for 0 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteStable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0001 begin');
      const expected: number = MediaTools.getMsFromByteLength(0);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getMsFromByteLength(0) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0001 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_0200
     * @tc.name      testByteStable0002
     * @tc.desc      Verify byte conversion for 1920 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteStable0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0002 begin');
      const expected: number = MediaTools.getMsFromByteLength(1920);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getMsFromByteLength(1920) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0002 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_0300
     * @tc.name      testByteStable0003
     * @tc.desc      Verify byte conversion for 96000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteStable0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0003 begin');
      const expected: number = MediaTools.getMsFromByteLength(96000);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getMsFromByteLength(96000) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0003 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_0400
     * @tc.name      testByteStable0004
     * @tc.desc      Verify byte conversion for 192000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteStable0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0004 begin');
      const expected: number = MediaTools.getMsFromByteLength(192000);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getMsFromByteLength(192000) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0004 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_0500
     * @tc.name      testByteStable0005
     * @tc.desc      Verify byte conversion for 384000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteStable0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0005 begin');
      const expected: number = MediaTools.getMsFromByteLength(384000);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getMsFromByteLength(384000) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0005 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_0600
     * @tc.name      testByteStable0006
     * @tc.desc      Verify byte conversion for 480000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteStable0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0006 begin');
      const expected: number = MediaTools.getMsFromByteLength(480000);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getMsFromByteLength(480000) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0006 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_0700
     * @tc.name      testByteStable0007
     * @tc.desc      Verify byte conversion for 960000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteStable0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0007 begin');
      const expected: number = MediaTools.getMsFromByteLength(960000);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getMsFromByteLength(960000) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0007 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_0800
     * @tc.name      testByteStable0008
     * @tc.desc      Verify byte conversion for 1920000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteStable0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0008 begin');
      const expected: number = MediaTools.getMsFromByteLength(1920000);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getMsFromByteLength(1920000) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0008 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_0900
     * @tc.name      testByteStable0009
     * @tc.desc      Verify byte conversion for 1000000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteStable0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0009 begin');
      const expected: number = MediaTools.getMsFromByteLength(1000000);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getMsFromByteLength(1000000) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0009 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_1000
     * @tc.name      testByteStable0010
     * @tc.desc      Verify byte conversion for 1234567 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testByteStable0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0010 begin');
      const expected: number = MediaTools.getMsFromByteLength(1234567);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getMsFromByteLength(1234567) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testByteStable0010 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_1100
     * @tc.name      testOffsetStable0011
     * @tc.desc      Verify offset conversion for 0 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetStable0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0011 begin');
      const expected: number = MediaTools.getOffsetFromTime(0);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getOffsetFromTime(0) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0011 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_1200
     * @tc.name      testOffsetStable0012
     * @tc.desc      Verify offset conversion for 1 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetStable0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0012 begin');
      const expected: number = MediaTools.getOffsetFromTime(1);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getOffsetFromTime(1) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0012 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_1300
     * @tc.name      testOffsetStable0013
     * @tc.desc      Verify offset conversion for 500 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetStable0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0013 begin');
      const expected: number = MediaTools.getOffsetFromTime(500);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getOffsetFromTime(500) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0013 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_1400
     * @tc.name      testOffsetStable0014
     * @tc.desc      Verify offset conversion for 1000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetStable0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0014 begin');
      const expected: number = MediaTools.getOffsetFromTime(1000);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getOffsetFromTime(1000) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0014 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_1500
     * @tc.name      testOffsetStable0015
     * @tc.desc      Verify offset conversion for 1500 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetStable0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0015 begin');
      const expected: number = MediaTools.getOffsetFromTime(1500);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getOffsetFromTime(1500) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0015 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_1600
     * @tc.name      testOffsetStable0016
     * @tc.desc      Verify offset conversion for 60000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetStable0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0016 begin');
      const expected: number = MediaTools.getOffsetFromTime(60000);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getOffsetFromTime(60000) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0016 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_1700
     * @tc.name      testOffsetStable0017
     * @tc.desc      Verify offset conversion for 3600000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetStable0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0017 begin');
      const expected: number = MediaTools.getOffsetFromTime(3600000);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getOffsetFromTime(3600000) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0017 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_1800
     * @tc.name      testOffsetStable0018
     * @tc.desc      Verify offset conversion for 86400000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetStable0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0018 begin');
      const expected: number = MediaTools.getOffsetFromTime(86400000);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getOffsetFromTime(86400000) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0018 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_1900
     * @tc.name      testOffsetStable0019
     * @tc.desc      Verify offset conversion for 123456789 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetStable0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0019 begin');
      const expected: number = MediaTools.getOffsetFromTime(123456789);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getOffsetFromTime(123456789) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0019 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_2000
     * @tc.name      testOffsetStable0020
     * @tc.desc      Verify offset conversion for 1000000000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOffsetStable0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0020 begin');
      const expected: number = MediaTools.getOffsetFromTime(1000000000);
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.getOffsetFromTime(1000000000) !== expected) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffsetStable0020 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_2100
     * @tc.name      testCountdownStable0021
     * @tc.desc      Verify countdown text for 0 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownStable0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0021 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.msToCountdownTime(0) !== '00:00') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0021 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_2200
     * @tc.name      testCountdownStable0022
     * @tc.desc      Verify countdown text for 1000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownStable0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0022 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.msToCountdownTime(1000) !== '00:01') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0022 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_2300
     * @tc.name      testCountdownStable0023
     * @tc.desc      Verify countdown text for 59999 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownStable0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0023 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.msToCountdownTime(59999) !== '00:59') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0023 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_2400
     * @tc.name      testCountdownStable0024
     * @tc.desc      Verify countdown text for 60000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownStable0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0024 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.msToCountdownTime(60000) !== '01:00') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0024 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_2500
     * @tc.name      testCountdownStable0025
     * @tc.desc      Verify countdown text for 3600000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownStable0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0025 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.msToCountdownTime(3600000) !== '01:\n      00:00') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0025 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_2600
     * @tc.name      testCountdownStable0026
     * @tc.desc      Verify countdown text for 3661000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownStable0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0026 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.msToCountdownTime(3661000) !== '01:\n      01:01') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0026 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_2700
     * @tc.name      testCountdownStable0027
     * @tc.desc      Verify countdown text for 86400000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownStable0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0027 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.msToCountdownTime(86400000) !== '01:\n      00:00') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0027 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_2800
     * @tc.name      testCountdownStable0028
     * @tc.desc      Verify countdown text for 90061000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownStable0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0028 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.msToCountdownTime(90061000) !== '01:01:\n      01:01') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0028 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_2900
     * @tc.name      testCountdownStable0029
     * @tc.desc      Verify countdown text for 1000000000 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownStable0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0029 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.msToCountdownTime(1000000000) !== '11:13:\n      46:40') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0029 end');
    })

    /**
     * @tc.number    SUB_CAPTURER_STABP1_3000
     * @tc.name      testCountdownStable0030
     * @tc.desc      Verify countdown text for 123456789 is stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountdownStable0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0030 begin');
      let stable: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (MediaTools.msToCountdownTime(123456789) !== '01:10:\n      17:36') {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountdownStable0030 end');
    })

  })
}
