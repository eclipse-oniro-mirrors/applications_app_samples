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
import { beforeEach, describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MediaSourceSpeedCycle]';
const DOMAIN: number = 0xF812;

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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceSpeedCycleTest(): void {
  describe('mediaSourceSpeedCycleTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0001
     * @tc.name      testExtSpeedCycle0000
     * @tc.desc      Speed index 0 after 0 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 0;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0002
     * @tc.name      testExtSpeedCycle0001
     * @tc.desc      Speed index 1 after 2 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 2;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0003
     * @tc.name      testExtSpeedCycle0002
     * @tc.desc      Speed index 2 after 4 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 4;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0004
     * @tc.name      testExtSpeedCycle0003
     * @tc.desc      Speed index 3 after 6 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 6;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0005
     * @tc.name      testExtSpeedCycle0004
     * @tc.desc      Speed index 0 after 8 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 8;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0006
     * @tc.name      testExtSpeedCycle0005
     * @tc.desc      Speed index 1 after 10 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 10;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0007
     * @tc.name      testExtSpeedCycle0006
     * @tc.desc      Speed index 2 after 12 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 12;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0008
     * @tc.name      testExtSpeedCycle0007
     * @tc.desc      Speed index 3 after 14 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 14;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0009
     * @tc.name      testExtSpeedCycle0008
     * @tc.desc      Speed index 0 after 16 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 16;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0010
     * @tc.name      testExtSpeedCycle0009
     * @tc.desc      Speed index 1 after 18 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 18;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0011
     * @tc.name      testExtSpeedCycle0010
     * @tc.desc      Speed index 2 after 20 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 20;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0012
     * @tc.name      testExtSpeedCycle0011
     * @tc.desc      Speed index 3 after 1 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 1;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0013
     * @tc.name      testExtSpeedCycle0012
     * @tc.desc      Speed index 0 after 3 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 3;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0014
     * @tc.name      testExtSpeedCycle0013
     * @tc.desc      Speed index 1 after 5 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 5;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0015
     * @tc.name      testExtSpeedCycle0014
     * @tc.desc      Speed index 2 after 7 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 7;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0016
     * @tc.name      testExtSpeedCycle0015
     * @tc.desc      Speed index 3 after 9 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 9;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0017
     * @tc.name      testExtSpeedCycle0016
     * @tc.desc      Speed index 0 after 11 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 11;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0018
     * @tc.name      testExtSpeedCycle0017
     * @tc.desc      Speed index 1 after 13 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 13;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0019
     * @tc.name      testExtSpeedCycle0018
     * @tc.desc      Speed index 2 after 15 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 15;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0020
     * @tc.name      testExtSpeedCycle0019
     * @tc.desc      Speed index 3 after 17 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 17;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0021
     * @tc.name      testExtSpeedCycle0020
     * @tc.desc      Speed index 0 after 19 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 19;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0022
     * @tc.name      testExtSpeedCycle0021
     * @tc.desc      Speed index 1 after 0 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 0;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0023
     * @tc.name      testExtSpeedCycle0022
     * @tc.desc      Speed index 2 after 2 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 2;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0024
     * @tc.name      testExtSpeedCycle0023
     * @tc.desc      Speed index 3 after 4 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 4;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0025
     * @tc.name      testExtSpeedCycle0024
     * @tc.desc      Speed index 0 after 6 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 6;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0026
     * @tc.name      testExtSpeedCycle0025
     * @tc.desc      Speed index 1 after 8 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 8;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0027
     * @tc.name      testExtSpeedCycle0026
     * @tc.desc      Speed index 2 after 10 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 10;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0028
     * @tc.name      testExtSpeedCycle0027
     * @tc.desc      Speed index 3 after 12 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 12;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0029
     * @tc.name      testExtSpeedCycle0028
     * @tc.desc      Speed index 0 after 14 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 14;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0030
     * @tc.name      testExtSpeedCycle0029
     * @tc.desc      Speed index 1 after 16 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 16;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0031
     * @tc.name      testExtSpeedCycle0030
     * @tc.desc      Speed index 2 after 18 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 18;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0032
     * @tc.name      testExtSpeedCycle0031
     * @tc.desc      Speed index 3 after 20 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 20;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0033
     * @tc.name      testExtSpeedCycle0032
     * @tc.desc      Speed index 0 after 1 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 1;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0034
     * @tc.name      testExtSpeedCycle0033
     * @tc.desc      Speed index 1 after 3 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 3;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0035
     * @tc.name      testExtSpeedCycle0034
     * @tc.desc      Speed index 2 after 5 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 5;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0036
     * @tc.name      testExtSpeedCycle0035
     * @tc.desc      Speed index 3 after 7 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 7;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0037
     * @tc.name      testExtSpeedCycle0036
     * @tc.desc      Speed index 0 after 9 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 9;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0038
     * @tc.name      testExtSpeedCycle0037
     * @tc.desc      Speed index 1 after 11 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 11;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0039
     * @tc.name      testExtSpeedCycle0038
     * @tc.desc      Speed index 2 after 13 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 13;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0040
     * @tc.name      testExtSpeedCycle0039
     * @tc.desc      Speed index 3 after 15 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 15;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0041
     * @tc.name      testExtSpeedCycle0040
     * @tc.desc      Speed index 0 after 17 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 17;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0042
     * @tc.name      testExtSpeedCycle0041
     * @tc.desc      Speed index 1 after 19 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 19;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0043
     * @tc.name      testExtSpeedCycle0042
     * @tc.desc      Speed index 2 after 0 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 0;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0044
     * @tc.name      testExtSpeedCycle0043
     * @tc.desc      Speed index 3 after 2 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 2;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0045
     * @tc.name      testExtSpeedCycle0044
     * @tc.desc      Speed index 0 after 4 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 4;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0046
     * @tc.name      testExtSpeedCycle0045
     * @tc.desc      Speed index 1 after 6 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 6;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0047
     * @tc.name      testExtSpeedCycle0046
     * @tc.desc      Speed index 2 after 8 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 8;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0048
     * @tc.name      testExtSpeedCycle0047
     * @tc.desc      Speed index 3 after 10 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 10;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0049
     * @tc.name      testExtSpeedCycle0048
     * @tc.desc      Speed index 0 after 12 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 12;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0050
     * @tc.name      testExtSpeedCycle0049
     * @tc.desc      Speed index 1 after 14 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 14;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0051
     * @tc.name      testExtSpeedCycle0050
     * @tc.desc      Speed index 2 after 16 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 16;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0052
     * @tc.name      testExtSpeedCycle0051
     * @tc.desc      Speed index 3 after 18 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 18;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0053
     * @tc.name      testExtSpeedCycle0052
     * @tc.desc      Speed index 0 after 20 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 20;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0054
     * @tc.name      testExtSpeedCycle0053
     * @tc.desc      Speed index 1 after 1 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 1;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0055
     * @tc.name      testExtSpeedCycle0054
     * @tc.desc      Speed index 2 after 3 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 3;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0056
     * @tc.name      testExtSpeedCycle0055
     * @tc.desc      Speed index 3 after 5 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 5;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0057
     * @tc.name      testExtSpeedCycle0056
     * @tc.desc      Speed index 0 after 7 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 7;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0058
     * @tc.name      testExtSpeedCycle0057
     * @tc.desc      Speed index 1 after 9 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 9;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0059
     * @tc.name      testExtSpeedCycle0058
     * @tc.desc      Speed index 2 after 11 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 11;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0060
     * @tc.name      testExtSpeedCycle0059
     * @tc.desc      Speed index 3 after 13 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 13;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0061
     * @tc.name      testExtSpeedCycle0060
     * @tc.desc      Speed index 0 after 15 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 15;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0062
     * @tc.name      testExtSpeedCycle0061
     * @tc.desc      Speed index 1 after 17 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 17;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0063
     * @tc.name      testExtSpeedCycle0062
     * @tc.desc      Speed index 2 after 19 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 19;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0064
     * @tc.name      testExtSpeedCycle0063
     * @tc.desc      Speed index 3 after 0 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 0;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0065
     * @tc.name      testExtSpeedCycle0064
     * @tc.desc      Speed index 0 after 2 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 2;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0066
     * @tc.name      testExtSpeedCycle0065
     * @tc.desc      Speed index 1 after 4 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 4;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0067
     * @tc.name      testExtSpeedCycle0066
     * @tc.desc      Speed index 2 after 6 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 6;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0068
     * @tc.name      testExtSpeedCycle0067
     * @tc.desc      Speed index 3 after 8 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 8;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0069
     * @tc.name      testExtSpeedCycle0068
     * @tc.desc      Speed index 0 after 10 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 10;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0070
     * @tc.name      testExtSpeedCycle0069
     * @tc.desc      Speed index 1 after 12 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 12;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0071
     * @tc.name      testExtSpeedCycle0070
     * @tc.desc      Speed index 2 after 14 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 14;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0072
     * @tc.name      testExtSpeedCycle0071
     * @tc.desc      Speed index 3 after 16 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 16;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0073
     * @tc.name      testExtSpeedCycle0072
     * @tc.desc      Speed index 0 after 18 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 18;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0074
     * @tc.name      testExtSpeedCycle0073
     * @tc.desc      Speed index 1 after 20 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 20;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0075
     * @tc.name      testExtSpeedCycle0074
     * @tc.desc      Speed index 2 after 1 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 1;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0076
     * @tc.name      testExtSpeedCycle0075
     * @tc.desc      Speed index 3 after 3 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 3;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(2);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0077
     * @tc.name      testExtSpeedCycle0076
     * @tc.desc      Speed index 0 after 5 taps resolves to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 0;
      const steps: number = 5;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(1);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0078
     * @tc.name      testExtSpeedCycle0077
     * @tc.desc      Speed index 1 after 7 taps resolves to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 1;
      const steps: number = 7;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(0);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0079
     * @tc.name      testExtSpeedCycle0078
     * @tc.desc      Speed index 2 after 9 taps resolves to 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 2;
      const steps: number = 9;
      for (let step: number = 0; step < steps; step++) {
        speedIndex = (speedIndex + 1) % 4;
      }
      expect(speedIndex).assertEqual(3);
      expect(speedIndex).assertLargerOrEqual(0);
      expect(speedIndex).assertLess(4);
      expect(names[speedIndex].length).assertLarger(0);
      expect(names.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEED_0080
     * @tc.name      testExtSpeedCycle0079
     * @tc.desc      Speed index 3 after 11 taps resolves to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedCycle0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['1.0X', '1.25X', '1.75X', '2.0X'];
      let speedIndex: number = 3;
      const steps: number = 11;
      for (let step: number = 0; step < steps; step++) {
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
