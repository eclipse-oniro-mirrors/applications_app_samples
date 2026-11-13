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

const TAG: string = '[Sample_playWithCacheSpeedCycle]';
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
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function playWithCacheSpeedCycleTest(): void {
  describe('playWithCacheSpeedCycleTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0001
     * @tc.name      testExtCacheSpeed0000
     * @tc.desc      Speed 0 after 0 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 0; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0002
     * @tc.name      testExtCacheSpeed0001
     * @tc.desc      Speed 1 after 2 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 2; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0003
     * @tc.name      testExtCacheSpeed0002
     * @tc.desc      Speed 2 after 4 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 4; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0004
     * @tc.name      testExtCacheSpeed0003
     * @tc.desc      Speed 3 after 6 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 6; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0005
     * @tc.name      testExtCacheSpeed0004
     * @tc.desc      Speed 0 after 8 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 8; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0006
     * @tc.name      testExtCacheSpeed0005
     * @tc.desc      Speed 1 after 10 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 10; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0007
     * @tc.name      testExtCacheSpeed0006
     * @tc.desc      Speed 2 after 12 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 12; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0008
     * @tc.name      testExtCacheSpeed0007
     * @tc.desc      Speed 3 after 14 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 14; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0009
     * @tc.name      testExtCacheSpeed0008
     * @tc.desc      Speed 0 after 16 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 16; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0010
     * @tc.name      testExtCacheSpeed0009
     * @tc.desc      Speed 1 after 18 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 18; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0011
     * @tc.name      testExtCacheSpeed0010
     * @tc.desc      Speed 2 after 20 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 20; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0012
     * @tc.name      testExtCacheSpeed0011
     * @tc.desc      Speed 3 after 1 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 1; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0013
     * @tc.name      testExtCacheSpeed0012
     * @tc.desc      Speed 0 after 3 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 3; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0014
     * @tc.name      testExtCacheSpeed0013
     * @tc.desc      Speed 1 after 5 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 5; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0015
     * @tc.name      testExtCacheSpeed0014
     * @tc.desc      Speed 2 after 7 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 7; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0016
     * @tc.name      testExtCacheSpeed0015
     * @tc.desc      Speed 3 after 9 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 9; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0017
     * @tc.name      testExtCacheSpeed0016
     * @tc.desc      Speed 0 after 11 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 11; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0018
     * @tc.name      testExtCacheSpeed0017
     * @tc.desc      Speed 1 after 13 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 13; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0019
     * @tc.name      testExtCacheSpeed0018
     * @tc.desc      Speed 2 after 15 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 15; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0020
     * @tc.name      testExtCacheSpeed0019
     * @tc.desc      Speed 3 after 17 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 17; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0021
     * @tc.name      testExtCacheSpeed0020
     * @tc.desc      Speed 0 after 19 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 19; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0022
     * @tc.name      testExtCacheSpeed0021
     * @tc.desc      Speed 1 after 0 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 0; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0023
     * @tc.name      testExtCacheSpeed0022
     * @tc.desc      Speed 2 after 2 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 2; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0024
     * @tc.name      testExtCacheSpeed0023
     * @tc.desc      Speed 3 after 4 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 4; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0025
     * @tc.name      testExtCacheSpeed0024
     * @tc.desc      Speed 0 after 6 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 6; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0026
     * @tc.name      testExtCacheSpeed0025
     * @tc.desc      Speed 1 after 8 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 8; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0027
     * @tc.name      testExtCacheSpeed0026
     * @tc.desc      Speed 2 after 10 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 10; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0028
     * @tc.name      testExtCacheSpeed0027
     * @tc.desc      Speed 3 after 12 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 12; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0029
     * @tc.name      testExtCacheSpeed0028
     * @tc.desc      Speed 0 after 14 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 14; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0030
     * @tc.name      testExtCacheSpeed0029
     * @tc.desc      Speed 1 after 16 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 16; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0031
     * @tc.name      testExtCacheSpeed0030
     * @tc.desc      Speed 2 after 18 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 18; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0032
     * @tc.name      testExtCacheSpeed0031
     * @tc.desc      Speed 3 after 20 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 20; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0033
     * @tc.name      testExtCacheSpeed0032
     * @tc.desc      Speed 0 after 1 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 1; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0034
     * @tc.name      testExtCacheSpeed0033
     * @tc.desc      Speed 1 after 3 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 3; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0035
     * @tc.name      testExtCacheSpeed0034
     * @tc.desc      Speed 2 after 5 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 5; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0036
     * @tc.name      testExtCacheSpeed0035
     * @tc.desc      Speed 3 after 7 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 7; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0037
     * @tc.name      testExtCacheSpeed0036
     * @tc.desc      Speed 0 after 9 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 9; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0038
     * @tc.name      testExtCacheSpeed0037
     * @tc.desc      Speed 1 after 11 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 11; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0039
     * @tc.name      testExtCacheSpeed0038
     * @tc.desc      Speed 2 after 13 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 13; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0040
     * @tc.name      testExtCacheSpeed0039
     * @tc.desc      Speed 3 after 15 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 15; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0041
     * @tc.name      testExtCacheSpeed0040
     * @tc.desc      Speed 0 after 17 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 17; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0042
     * @tc.name      testExtCacheSpeed0041
     * @tc.desc      Speed 1 after 19 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 19; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0043
     * @tc.name      testExtCacheSpeed0042
     * @tc.desc      Speed 2 after 0 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 0; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0044
     * @tc.name      testExtCacheSpeed0043
     * @tc.desc      Speed 3 after 2 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 2; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0045
     * @tc.name      testExtCacheSpeed0044
     * @tc.desc      Speed 0 after 4 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 4; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0046
     * @tc.name      testExtCacheSpeed0045
     * @tc.desc      Speed 1 after 6 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 6; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0047
     * @tc.name      testExtCacheSpeed0046
     * @tc.desc      Speed 2 after 8 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 8; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0048
     * @tc.name      testExtCacheSpeed0047
     * @tc.desc      Speed 3 after 10 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 10; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0049
     * @tc.name      testExtCacheSpeed0048
     * @tc.desc      Speed 0 after 12 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 12; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0050
     * @tc.name      testExtCacheSpeed0049
     * @tc.desc      Speed 1 after 14 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 14; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0051
     * @tc.name      testExtCacheSpeed0050
     * @tc.desc      Speed 2 after 16 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 16; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0052
     * @tc.name      testExtCacheSpeed0051
     * @tc.desc      Speed 3 after 18 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 18; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0053
     * @tc.name      testExtCacheSpeed0052
     * @tc.desc      Speed 0 after 20 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 20; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0054
     * @tc.name      testExtCacheSpeed0053
     * @tc.desc      Speed 1 after 1 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 1; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0055
     * @tc.name      testExtCacheSpeed0054
     * @tc.desc      Speed 2 after 3 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 3; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0056
     * @tc.name      testExtCacheSpeed0055
     * @tc.desc      Speed 3 after 5 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 5; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0057
     * @tc.name      testExtCacheSpeed0056
     * @tc.desc      Speed 0 after 7 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 7; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0058
     * @tc.name      testExtCacheSpeed0057
     * @tc.desc      Speed 1 after 9 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 9; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0059
     * @tc.name      testExtCacheSpeed0058
     * @tc.desc      Speed 2 after 11 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 11; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0060
     * @tc.name      testExtCacheSpeed0059
     * @tc.desc      Speed 3 after 13 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 13; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0061
     * @tc.name      testExtCacheSpeed0060
     * @tc.desc      Speed 0 after 15 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 15; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0062
     * @tc.name      testExtCacheSpeed0061
     * @tc.desc      Speed 1 after 17 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 17; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0063
     * @tc.name      testExtCacheSpeed0062
     * @tc.desc      Speed 2 after 19 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 19; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0064
     * @tc.name      testExtCacheSpeed0063
     * @tc.desc      Speed 3 after 0 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 0; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0065
     * @tc.name      testExtCacheSpeed0064
     * @tc.desc      Speed 0 after 2 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 2; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0066
     * @tc.name      testExtCacheSpeed0065
     * @tc.desc      Speed 1 after 4 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 4; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0067
     * @tc.name      testExtCacheSpeed0066
     * @tc.desc      Speed 2 after 6 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 6; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0068
     * @tc.name      testExtCacheSpeed0067
     * @tc.desc      Speed 3 after 8 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 8; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0069
     * @tc.name      testExtCacheSpeed0068
     * @tc.desc      Speed 0 after 10 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 10; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0070
     * @tc.name      testExtCacheSpeed0069
     * @tc.desc      Speed 1 after 12 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 12; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0071
     * @tc.name      testExtCacheSpeed0070
     * @tc.desc      Speed 2 after 14 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 14; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0072
     * @tc.name      testExtCacheSpeed0071
     * @tc.desc      Speed 3 after 16 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 16; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0073
     * @tc.name      testExtCacheSpeed0072
     * @tc.desc      Speed 0 after 18 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 18; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0074
     * @tc.name      testExtCacheSpeed0073
     * @tc.desc      Speed 1 after 20 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 20; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0075
     * @tc.name      testExtCacheSpeed0074
     * @tc.desc      Speed 2 after 1 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 1; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0076
     * @tc.name      testExtCacheSpeed0075
     * @tc.desc      Speed 3 after 3 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 3; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0077
     * @tc.name      testExtCacheSpeed0076
     * @tc.desc      Speed 0 after 5 taps is 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      for (let step: number = 0; step < 5; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0078
     * @tc.name      testExtCacheSpeed0077
     * @tc.desc      Speed 1 after 7 taps is 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      for (let step: number = 0; step < 7; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0079
     * @tc.name      testExtCacheSpeed0078
     * @tc.desc      Speed 2 after 9 taps is 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      for (let step: number = 0; step < 9; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SPEED_0080
     * @tc.name      testExtCacheSpeed0079
     * @tc.desc      Speed 3 after 11 taps is 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSpeed0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      for (let step: number = 0; step < 11; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
  });
}
