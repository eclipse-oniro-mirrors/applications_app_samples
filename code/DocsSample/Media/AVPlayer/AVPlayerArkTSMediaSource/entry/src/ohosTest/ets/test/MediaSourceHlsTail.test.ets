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

const TAG: string = '[Sample_MediaSourceHlsTail]';
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

export default function mediaSourceHlsTailTest(): void {
  describe('mediaSourceHlsTailTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0001
     * @tc.name      testSafeHlsTail0001
     * @tc.desc      Timeline 0 maps to segment 0 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 0;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(0);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0002
     * @tc.name      testSafeHlsTail0002
     * @tc.desc      Timeline 1000 maps to segment 0 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 1000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(0);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0003
     * @tc.name      testSafeHlsTail0003
     * @tc.desc      Timeline 2000 maps to segment 0 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 2000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(0);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0004
     * @tc.name      testSafeHlsTail0004
     * @tc.desc      Timeline 3000 maps to segment 0 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 3000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(0);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0005
     * @tc.name      testSafeHlsTail0005
     * @tc.desc      Timeline 4000 maps to segment 1 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 4000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(1);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0006
     * @tc.name      testSafeHlsTail0006
     * @tc.desc      Timeline 5000 maps to segment 1 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 5000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(1);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0007
     * @tc.name      testSafeHlsTail0007
     * @tc.desc      Timeline 6000 maps to segment 1 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 6000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(1);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0008
     * @tc.name      testSafeHlsTail0008
     * @tc.desc      Timeline 7000 maps to segment 1 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 7000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(1);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0009
     * @tc.name      testSafeHlsTail0009
     * @tc.desc      Timeline 8000 maps to segment 2 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 8000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(2);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0010
     * @tc.name      testSafeHlsTail0010
     * @tc.desc      Timeline 9000 maps to segment 2 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 9000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(2);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0011
     * @tc.name      testSafeHlsTail0011
     * @tc.desc      Timeline 10000 maps to segment 2 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 10000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(2);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0012
     * @tc.name      testSafeHlsTail0012
     * @tc.desc      Timeline 11000 maps to segment 2 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 11000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(2);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0013
     * @tc.name      testSafeHlsTail0013
     * @tc.desc      Timeline 12000 maps to segment 3 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 12000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(3);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0014
     * @tc.name      testSafeHlsTail0014
     * @tc.desc      Timeline 13000 maps to segment 3 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 13000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(3);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0015
     * @tc.name      testSafeHlsTail0015
     * @tc.desc      Timeline 14000 maps to segment 3 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 14000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(3);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0016
     * @tc.name      testSafeHlsTail0016
     * @tc.desc      Timeline 15000 maps to segment 3 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 15000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(3);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0017
     * @tc.name      testSafeHlsTail0017
     * @tc.desc      Timeline 16000 maps to segment 4 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 16000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(4);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0018
     * @tc.name      testSafeHlsTail0018
     * @tc.desc      Timeline 17000 maps to segment 4 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 17000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(4);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0019
     * @tc.name      testSafeHlsTail0019
     * @tc.desc      Timeline 18000 maps to segment 4 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 18000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(4);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0020
     * @tc.name      testSafeHlsTail0020
     * @tc.desc      Timeline 19000 maps to segment 4 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 19000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(4);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0021
     * @tc.name      testSafeHlsTail0021
     * @tc.desc      Timeline 20000 maps to segment 5 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 20000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(5);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0022
     * @tc.name      testSafeHlsTail0022
     * @tc.desc      Timeline 21000 maps to segment 5 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 21000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(5);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0023
     * @tc.name      testSafeHlsTail0023
     * @tc.desc      Timeline 22000 maps to segment 5 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 22000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(5);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0024
     * @tc.name      testSafeHlsTail0024
     * @tc.desc      Timeline 23000 maps to segment 5 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 23000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(5);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0025
     * @tc.name      testSafeHlsTail0025
     * @tc.desc      Timeline 24000 maps to segment 6 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 24000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(6);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0026
     * @tc.name      testSafeHlsTail0026
     * @tc.desc      Timeline 25000 maps to segment 6 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 25000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(6);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0027
     * @tc.name      testSafeHlsTail0027
     * @tc.desc      Timeline 26000 maps to segment 6 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 26000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(6);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0028
     * @tc.name      testSafeHlsTail0028
     * @tc.desc      Timeline 27000 maps to segment 6 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 27000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(6);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0029
     * @tc.name      testSafeHlsTail0029
     * @tc.desc      Timeline 28000 maps to segment 7 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 28000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(7);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0030
     * @tc.name      testSafeHlsTail0030
     * @tc.desc      Timeline 29000 maps to segment 7 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 29000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(7);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0031
     * @tc.name      testSafeHlsTail0031
     * @tc.desc      Timeline 30000 maps to segment 7 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 30000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(7);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0032
     * @tc.name      testSafeHlsTail0032
     * @tc.desc      Timeline 31000 maps to segment 7 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 31000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(7);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0033
     * @tc.name      testSafeHlsTail0033
     * @tc.desc      Timeline 32000 maps to segment 8 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 32000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(8);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0034
     * @tc.name      testSafeHlsTail0034
     * @tc.desc      Timeline 33000 maps to segment 8 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 33000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(8);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0035
     * @tc.name      testSafeHlsTail0035
     * @tc.desc      Timeline 34000 maps to segment 8 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 34000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(8);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0036
     * @tc.name      testSafeHlsTail0036
     * @tc.desc      Timeline 35000 maps to segment 8 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 35000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(8);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0037
     * @tc.name      testSafeHlsTail0037
     * @tc.desc      Timeline 36000 maps to segment 9 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 36000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(9);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0038
     * @tc.name      testSafeHlsTail0038
     * @tc.desc      Timeline 37000 maps to segment 9 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 37000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(9);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0039
     * @tc.name      testSafeHlsTail0039
     * @tc.desc      Timeline 38000 maps to segment 9 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 38000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(9);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0040
     * @tc.name      testSafeHlsTail0040
     * @tc.desc      Timeline 39000 maps to segment 9 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 39000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(9);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0041
     * @tc.name      testSafeHlsTail0041
     * @tc.desc      Timeline 40000 maps to segment 10 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 40000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(10);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0042
     * @tc.name      testSafeHlsTail0042
     * @tc.desc      Timeline 41000 maps to segment 10 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 41000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(10);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0043
     * @tc.name      testSafeHlsTail0043
     * @tc.desc      Timeline 42000 maps to segment 10 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 42000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(10);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0044
     * @tc.name      testSafeHlsTail0044
     * @tc.desc      Timeline 43000 maps to segment 10 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 43000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(10);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0045
     * @tc.name      testSafeHlsTail0045
     * @tc.desc      Timeline 44000 maps to segment 11 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 44000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(11);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0046
     * @tc.name      testSafeHlsTail0046
     * @tc.desc      Timeline 45000 maps to segment 11 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 45000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(11);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0047
     * @tc.name      testSafeHlsTail0047
     * @tc.desc      Timeline 46000 maps to segment 11 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 46000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(11);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0048
     * @tc.name      testSafeHlsTail0048
     * @tc.desc      Timeline 47000 maps to segment 11 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 47000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(11);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0049
     * @tc.name      testSafeHlsTail0049
     * @tc.desc      Timeline 48000 maps to segment 12 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 48000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(12);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0050
     * @tc.name      testSafeHlsTail0050
     * @tc.desc      Timeline 49000 maps to segment 12 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 49000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(12);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0051
     * @tc.name      testSafeHlsTail0051
     * @tc.desc      Timeline 50000 maps to segment 12 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 50000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(12);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0052
     * @tc.name      testSafeHlsTail0052
     * @tc.desc      Timeline 51000 maps to segment 12 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 51000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(12);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0053
     * @tc.name      testSafeHlsTail0053
     * @tc.desc      Timeline 52000 maps to segment 13 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 52000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(13);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0054
     * @tc.name      testSafeHlsTail0054
     * @tc.desc      Timeline 53000 maps to segment 13 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 53000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(13);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0055
     * @tc.name      testSafeHlsTail0055
     * @tc.desc      Timeline 54000 maps to segment 13 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 54000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(13);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0056
     * @tc.name      testSafeHlsTail0056
     * @tc.desc      Timeline 55000 maps to segment 13 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 55000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(13);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0057
     * @tc.name      testSafeHlsTail0057
     * @tc.desc      Timeline 56000 maps to segment 14 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 56000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(14);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0058
     * @tc.name      testSafeHlsTail0058
     * @tc.desc      Timeline 57000 maps to segment 14 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 57000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(14);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0059
     * @tc.name      testSafeHlsTail0059
     * @tc.desc      Timeline 58000 maps to segment 14 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 58000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(14);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0060
     * @tc.name      testSafeHlsTail0060
     * @tc.desc      Timeline 59000 maps to segment 14 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 59000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(14);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0061
     * @tc.name      testSafeHlsTail0061
     * @tc.desc      Timeline 60000 maps to segment 15 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 60000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(15);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0062
     * @tc.name      testSafeHlsTail0062
     * @tc.desc      Timeline 61000 maps to segment 15 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 61000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(15);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0063
     * @tc.name      testSafeHlsTail0063
     * @tc.desc      Timeline 62000 maps to segment 15 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 62000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(15);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0064
     * @tc.name      testSafeHlsTail0064
     * @tc.desc      Timeline 63000 maps to segment 15 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 63000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(15);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0065
     * @tc.name      testSafeHlsTail0065
     * @tc.desc      Timeline 64000 maps to segment 16 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 64000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(16);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0066
     * @tc.name      testSafeHlsTail0066
     * @tc.desc      Timeline 65000 maps to segment 16 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 65000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(16);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0067
     * @tc.name      testSafeHlsTail0067
     * @tc.desc      Timeline 66000 maps to segment 16 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 66000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(16);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0068
     * @tc.name      testSafeHlsTail0068
     * @tc.desc      Timeline 67000 maps to segment 16 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 67000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(16);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0069
     * @tc.name      testSafeHlsTail0069
     * @tc.desc      Timeline 68000 maps to segment 17 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 68000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(17);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0070
     * @tc.name      testSafeHlsTail0070
     * @tc.desc      Timeline 69000 maps to segment 17 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 69000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(17);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0071
     * @tc.name      testSafeHlsTail0071
     * @tc.desc      Timeline 70000 maps to segment 17 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 70000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(17);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0072
     * @tc.name      testSafeHlsTail0072
     * @tc.desc      Timeline 71000 maps to segment 17 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 71000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(17);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0073
     * @tc.name      testSafeHlsTail0073
     * @tc.desc      Timeline 72000 maps to segment 18 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 72000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(18);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0074
     * @tc.name      testSafeHlsTail0074
     * @tc.desc      Timeline 73000 maps to segment 18 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 73000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(18);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0075
     * @tc.name      testSafeHlsTail0075
     * @tc.desc      Timeline 74000 maps to segment 18 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 74000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(18);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0076
     * @tc.name      testSafeHlsTail0076
     * @tc.desc      Timeline 75000 maps to segment 18 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 75000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(18);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0077
     * @tc.name      testSafeHlsTail0077
     * @tc.desc      Timeline 76000 maps to segment 19 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 76000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(19);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0078
     * @tc.name      testSafeHlsTail0078
     * @tc.desc      Timeline 77000 maps to segment 19 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 77000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(19);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0079
     * @tc.name      testSafeHlsTail0079
     * @tc.desc      Timeline 78000 maps to segment 19 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 78000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(19);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0080
     * @tc.name      testSafeHlsTail0080
     * @tc.desc      Timeline 79000 maps to segment 19 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 79000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(19);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0081
     * @tc.name      testSafeHlsTail0081
     * @tc.desc      Timeline 80000 maps to segment 20 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 80000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(20);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0082
     * @tc.name      testSafeHlsTail0082
     * @tc.desc      Timeline 81000 maps to segment 20 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 81000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(20);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0083
     * @tc.name      testSafeHlsTail0083
     * @tc.desc      Timeline 82000 maps to segment 20 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 82000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(20);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0084
     * @tc.name      testSafeHlsTail0084
     * @tc.desc      Timeline 83000 maps to segment 20 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 83000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(20);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0085
     * @tc.name      testSafeHlsTail0085
     * @tc.desc      Timeline 84000 maps to segment 21 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 84000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(21);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0086
     * @tc.name      testSafeHlsTail0086
     * @tc.desc      Timeline 85000 maps to segment 21 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 85000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(21);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0087
     * @tc.name      testSafeHlsTail0087
     * @tc.desc      Timeline 86000 maps to segment 21 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 86000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(21);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0088
     * @tc.name      testSafeHlsTail0088
     * @tc.desc      Timeline 87000 maps to segment 21 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 87000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(21);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0089
     * @tc.name      testSafeHlsTail0089
     * @tc.desc      Timeline 88000 maps to segment 22 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 88000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(22);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0090
     * @tc.name      testSafeHlsTail0090
     * @tc.desc      Timeline 89000 maps to segment 22 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 89000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(22);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0091
     * @tc.name      testSafeHlsTail0091
     * @tc.desc      Timeline 90000 maps to segment 22 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 90000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(22);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0092
     * @tc.name      testSafeHlsTail0092
     * @tc.desc      Timeline 91000 maps to segment 22 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 91000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(22);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0093
     * @tc.name      testSafeHlsTail0093
     * @tc.desc      Timeline 92000 maps to segment 23 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 92000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(23);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0094
     * @tc.name      testSafeHlsTail0094
     * @tc.desc      Timeline 93000 maps to segment 23 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 93000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(23);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0095
     * @tc.name      testSafeHlsTail0095
     * @tc.desc      Timeline 94000 maps to segment 23 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 94000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(23);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0096
     * @tc.name      testSafeHlsTail0096
     * @tc.desc      Timeline 95000 maps to segment 23 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 95000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(23);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0097
     * @tc.name      testSafeHlsTail0097
     * @tc.desc      Timeline 96000 maps to segment 24 with remainder 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 96000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(24);
      expect(remainder).assertEqual(0);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0098
     * @tc.name      testSafeHlsTail0098
     * @tc.desc      Timeline 97000 maps to segment 24 with remainder 1000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 97000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(24);
      expect(remainder).assertEqual(1000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0099
     * @tc.name      testSafeHlsTail0099
     * @tc.desc      Timeline 98000 maps to segment 24 with remainder 2000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 98000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(24);
      expect(remainder).assertEqual(2000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_HLT_0100
     * @tc.name      testSafeHlsTail0100
     * @tc.desc      Timeline 99000 maps to segment 24 with remainder 3000.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeHlsTail0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const total: number = 99000;
      const segmentDuration: number = 4000;
      const segment: number = Math.floor(total / segmentDuration);
      const remainder: number = total % segmentDuration;
      expect(segment).assertEqual(24);
      expect(remainder).assertEqual(3000);
      expect(segment * segmentDuration + remainder).assertEqual(total);
      expect(total).assertLargerOrEqual(0);
    })
  })
}
