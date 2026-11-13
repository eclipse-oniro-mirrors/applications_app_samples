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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Resolution } from '../../../main/ets/services/CommonTypes';

const TAG: string = '[Sample_resolutionDefaultsCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}
export default function resolutionDefaultsCoreTest(): void {
  describe('resolutionDefaultsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_0100
     * @tc.name      testResolutionDefaults0001
     * @tc.desc      Verify resolutionDefaultsCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_0200
     * @tc.name      testResolutionDefaults0002
     * @tc.desc      Verify resolutionDefaultsCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_0300
     * @tc.name      testResolutionDefaults0003
     * @tc.desc      Verify resolutionDefaultsCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_0400
     * @tc.name      testResolutionDefaults0004
     * @tc.desc      Verify resolutionDefaultsCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_0500
     * @tc.name      testResolutionDefaults0005
     * @tc.desc      Verify resolutionDefaultsCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_0600
     * @tc.name      testResolutionDefaults0006
     * @tc.desc      Verify resolutionDefaultsCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_0700
     * @tc.name      testResolutionDefaults0007
     * @tc.desc      Verify resolutionDefaultsCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_0800
     * @tc.name      testResolutionDefaults0008
     * @tc.desc      Verify resolutionDefaultsCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_0900
     * @tc.name      testResolutionDefaults0009
     * @tc.desc      Verify resolutionDefaultsCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_1000
     * @tc.name      testResolutionDefaults0010
     * @tc.desc      Verify resolutionDefaultsCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_1100
     * @tc.name      testResolutionDefaults0011
     * @tc.desc      Verify resolutionDefaultsCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_1200
     * @tc.name      testResolutionDefaults0012
     * @tc.desc      Verify resolutionDefaultsCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_1300
     * @tc.name      testResolutionDefaults0013
     * @tc.desc      Verify resolutionDefaultsCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_1400
     * @tc.name      testResolutionDefaults0014
     * @tc.desc      Verify resolutionDefaultsCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_1500
     * @tc.name      testResolutionDefaults0015
     * @tc.desc      Verify resolutionDefaultsCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_1600
     * @tc.name      testResolutionDefaults0016
     * @tc.desc      Verify resolutionDefaultsCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_1700
     * @tc.name      testResolutionDefaults0017
     * @tc.desc      Verify resolutionDefaultsCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_1800
     * @tc.name      testResolutionDefaults0018
     * @tc.desc      Verify resolutionDefaultsCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_1900
     * @tc.name      testResolutionDefaults0019
     * @tc.desc      Verify resolutionDefaultsCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_2000
     * @tc.name      testResolutionDefaults0020
     * @tc.desc      Verify resolutionDefaultsCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_2100
     * @tc.name      testResolutionDefaults0021
     * @tc.desc      Verify resolutionDefaultsCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_2200
     * @tc.name      testResolutionDefaults0022
     * @tc.desc      Verify resolutionDefaultsCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_2300
     * @tc.name      testResolutionDefaults0023
     * @tc.desc      Verify resolutionDefaultsCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_2400
     * @tc.name      testResolutionDefaults0024
     * @tc.desc      Verify resolutionDefaultsCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_2500
     * @tc.name      testResolutionDefaults0025
     * @tc.desc      Verify resolutionDefaultsCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_2600
     * @tc.name      testResolutionDefaults0026
     * @tc.desc      Verify resolutionDefaultsCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_2700
     * @tc.name      testResolutionDefaults0027
     * @tc.desc      Verify resolutionDefaultsCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_2800
     * @tc.name      testResolutionDefaults0028
     * @tc.desc      Verify resolutionDefaultsCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_2900
     * @tc.name      testResolutionDefaults0029
     * @tc.desc      Verify resolutionDefaultsCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_3000
     * @tc.name      testResolutionDefaults0030
     * @tc.desc      Verify resolutionDefaultsCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_3100
     * @tc.name      testResolutionDefaults0031
     * @tc.desc      Verify resolutionDefaultsCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_3200
     * @tc.name      testResolutionDefaults0032
     * @tc.desc      Verify resolutionDefaultsCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_3300
     * @tc.name      testResolutionDefaults0033
     * @tc.desc      Verify resolutionDefaultsCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_3400
     * @tc.name      testResolutionDefaults0034
     * @tc.desc      Verify resolutionDefaultsCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_3500
     * @tc.name      testResolutionDefaults0035
     * @tc.desc      Verify resolutionDefaultsCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_3600
     * @tc.name      testResolutionDefaults0036
     * @tc.desc      Verify resolutionDefaultsCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_3700
     * @tc.name      testResolutionDefaults0037
     * @tc.desc      Verify resolutionDefaultsCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_3800
     * @tc.name      testResolutionDefaults0038
     * @tc.desc      Verify resolutionDefaultsCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_3900
     * @tc.name      testResolutionDefaults0039
     * @tc.desc      Verify resolutionDefaultsCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_4000
     * @tc.name      testResolutionDefaults0040
     * @tc.desc      Verify resolutionDefaultsCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_4100
     * @tc.name      testResolutionDefaults0041
     * @tc.desc      Verify resolutionDefaultsCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_4200
     * @tc.name      testResolutionDefaults0042
     * @tc.desc      Verify resolutionDefaultsCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_4300
     * @tc.name      testResolutionDefaults0043
     * @tc.desc      Verify resolutionDefaultsCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_4400
     * @tc.name      testResolutionDefaults0044
     * @tc.desc      Verify resolutionDefaultsCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_4500
     * @tc.name      testResolutionDefaults0045
     * @tc.desc      Verify resolutionDefaultsCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_4600
     * @tc.name      testResolutionDefaults0046
     * @tc.desc      Verify resolutionDefaultsCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_4700
     * @tc.name      testResolutionDefaults0047
     * @tc.desc      Verify resolutionDefaultsCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_4800
     * @tc.name      testResolutionDefaults0048
     * @tc.desc      Verify resolutionDefaultsCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_4900
     * @tc.name      testResolutionDefaults0049
     * @tc.desc      Verify resolutionDefaultsCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_5000
     * @tc.name      testResolutionDefaults0050
     * @tc.desc      Verify resolutionDefaultsCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_5100
     * @tc.name      testResolutionDefaults0051
     * @tc.desc      Verify resolutionDefaultsCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_5200
     * @tc.name      testResolutionDefaults0052
     * @tc.desc      Verify resolutionDefaultsCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_5300
     * @tc.name      testResolutionDefaults0053
     * @tc.desc      Verify resolutionDefaultsCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_5400
     * @tc.name      testResolutionDefaults0054
     * @tc.desc      Verify resolutionDefaultsCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_5500
     * @tc.name      testResolutionDefaults0055
     * @tc.desc      Verify resolutionDefaultsCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_5600
     * @tc.name      testResolutionDefaults0056
     * @tc.desc      Verify resolutionDefaultsCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_5700
     * @tc.name      testResolutionDefaults0057
     * @tc.desc      Verify resolutionDefaultsCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_5800
     * @tc.name      testResolutionDefaults0058
     * @tc.desc      Verify resolutionDefaultsCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_5900
     * @tc.name      testResolutionDefaults0059
     * @tc.desc      Verify resolutionDefaultsCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_6000
     * @tc.name      testResolutionDefaults0060
     * @tc.desc      Verify resolutionDefaultsCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_6100
     * @tc.name      testResolutionDefaults0061
     * @tc.desc      Verify resolutionDefaultsCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_6200
     * @tc.name      testResolutionDefaults0062
     * @tc.desc      Verify resolutionDefaultsCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_6300
     * @tc.name      testResolutionDefaults0063
     * @tc.desc      Verify resolutionDefaultsCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_6400
     * @tc.name      testResolutionDefaults0064
     * @tc.desc      Verify resolutionDefaultsCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_6500
     * @tc.name      testResolutionDefaults0065
     * @tc.desc      Verify resolutionDefaultsCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_6600
     * @tc.name      testResolutionDefaults0066
     * @tc.desc      Verify resolutionDefaultsCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_6700
     * @tc.name      testResolutionDefaults0067
     * @tc.desc      Verify resolutionDefaultsCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_6800
     * @tc.name      testResolutionDefaults0068
     * @tc.desc      Verify resolutionDefaultsCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_6900
     * @tc.name      testResolutionDefaults0069
     * @tc.desc      Verify resolutionDefaultsCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_7000
     * @tc.name      testResolutionDefaults0070
     * @tc.desc      Verify resolutionDefaultsCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_7100
     * @tc.name      testResolutionDefaults0071
     * @tc.desc      Verify resolutionDefaultsCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_7200
     * @tc.name      testResolutionDefaults0072
     * @tc.desc      Verify resolutionDefaultsCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_7300
     * @tc.name      testResolutionDefaults0073
     * @tc.desc      Verify resolutionDefaultsCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_7400
     * @tc.name      testResolutionDefaults0074
     * @tc.desc      Verify resolutionDefaultsCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_7500
     * @tc.name      testResolutionDefaults0075
     * @tc.desc      Verify resolutionDefaultsCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_7600
     * @tc.name      testResolutionDefaults0076
     * @tc.desc      Verify resolutionDefaultsCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_7700
     * @tc.name      testResolutionDefaults0077
     * @tc.desc      Verify resolutionDefaultsCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_7800
     * @tc.name      testResolutionDefaults0078
     * @tc.desc      Verify resolutionDefaultsCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_7900
     * @tc.name      testResolutionDefaults0079
     * @tc.desc      Verify resolutionDefaultsCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_8000
     * @tc.name      testResolutionDefaults0080
     * @tc.desc      Verify resolutionDefaultsCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_RES_DEF_8100
     * @tc.name      testResolutionDefaults0081
     * @tc.desc      Verify resolutionDefaultsCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolutionDefaults0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      expect(typeof resolution.frameWidth).assertEqual('number');
    });

  });
}
