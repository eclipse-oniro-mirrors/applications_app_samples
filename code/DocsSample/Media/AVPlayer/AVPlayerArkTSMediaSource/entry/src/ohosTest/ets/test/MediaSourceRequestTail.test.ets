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

const TAG: string = '[Sample_MediaSourceRequestTail]';
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

export default function mediaSourceRequestTailTest(): void {
  describe('mediaSourceRequestTailTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0001
     * @tc.name      testSafeRequestTail0001
     * @tc.desc      Request read size 1 is bounded by 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(1);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0002
     * @tc.name      testSafeRequestTail0002
     * @tc.desc      Request read size 32 is bounded by 32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 32;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(32);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0003
     * @tc.name      testSafeRequestTail0003
     * @tc.desc      Request read size 63 is bounded by 63.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 63;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(63);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0004
     * @tc.name      testSafeRequestTail0004
     * @tc.desc      Request read size 94 is bounded by 94.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 94;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(94);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0005
     * @tc.name      testSafeRequestTail0005
     * @tc.desc      Request read size 125 is bounded by 125.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 125;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(125);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0006
     * @tc.name      testSafeRequestTail0006
     * @tc.desc      Request read size 156 is bounded by 156.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 156;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(156);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0007
     * @tc.name      testSafeRequestTail0007
     * @tc.desc      Request read size 187 is bounded by 187.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 187;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(187);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0008
     * @tc.name      testSafeRequestTail0008
     * @tc.desc      Request read size 218 is bounded by 218.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 218;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(218);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0009
     * @tc.name      testSafeRequestTail0009
     * @tc.desc      Request read size 249 is bounded by 249.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 249;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(249);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0010
     * @tc.name      testSafeRequestTail0010
     * @tc.desc      Request read size 280 is bounded by 280.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 280;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(280);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0011
     * @tc.name      testSafeRequestTail0011
     * @tc.desc      Request read size 311 is bounded by 311.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 311;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(311);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0012
     * @tc.name      testSafeRequestTail0012
     * @tc.desc      Request read size 342 is bounded by 342.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 342;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(342);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0013
     * @tc.name      testSafeRequestTail0013
     * @tc.desc      Request read size 373 is bounded by 373.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 373;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(373);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0014
     * @tc.name      testSafeRequestTail0014
     * @tc.desc      Request read size 404 is bounded by 404.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 404;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(404);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0015
     * @tc.name      testSafeRequestTail0015
     * @tc.desc      Request read size 435 is bounded by 435.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 435;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(435);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0016
     * @tc.name      testSafeRequestTail0016
     * @tc.desc      Request read size 466 is bounded by 466.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 466;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(466);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0017
     * @tc.name      testSafeRequestTail0017
     * @tc.desc      Request read size 497 is bounded by 497.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 497;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(497);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0018
     * @tc.name      testSafeRequestTail0018
     * @tc.desc      Request read size 512 is bounded by 528.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 528;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0019
     * @tc.name      testSafeRequestTail0019
     * @tc.desc      Request read size 512 is bounded by 559.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 559;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0020
     * @tc.name      testSafeRequestTail0020
     * @tc.desc      Request read size 512 is bounded by 590.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 590;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0021
     * @tc.name      testSafeRequestTail0021
     * @tc.desc      Request read size 512 is bounded by 621.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 621;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0022
     * @tc.name      testSafeRequestTail0022
     * @tc.desc      Request read size 512 is bounded by 652.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 652;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0023
     * @tc.name      testSafeRequestTail0023
     * @tc.desc      Request read size 512 is bounded by 683.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 683;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0024
     * @tc.name      testSafeRequestTail0024
     * @tc.desc      Request read size 512 is bounded by 714.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 714;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0025
     * @tc.name      testSafeRequestTail0025
     * @tc.desc      Request read size 512 is bounded by 745.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 745;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0026
     * @tc.name      testSafeRequestTail0026
     * @tc.desc      Request read size 512 is bounded by 776.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 776;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0027
     * @tc.name      testSafeRequestTail0027
     * @tc.desc      Request read size 512 is bounded by 807.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 807;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0028
     * @tc.name      testSafeRequestTail0028
     * @tc.desc      Request read size 512 is bounded by 838.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 838;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0029
     * @tc.name      testSafeRequestTail0029
     * @tc.desc      Request read size 512 is bounded by 869.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 869;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0030
     * @tc.name      testSafeRequestTail0030
     * @tc.desc      Request read size 512 is bounded by 900.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 900;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0031
     * @tc.name      testSafeRequestTail0031
     * @tc.desc      Request read size 512 is bounded by 931.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 931;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0032
     * @tc.name      testSafeRequestTail0032
     * @tc.desc      Request read size 512 is bounded by 962.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 962;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0033
     * @tc.name      testSafeRequestTail0033
     * @tc.desc      Request read size 512 is bounded by 993.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 993;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0034
     * @tc.name      testSafeRequestTail0034
     * @tc.desc      Request read size 512 is bounded by 1024.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1024;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0035
     * @tc.name      testSafeRequestTail0035
     * @tc.desc      Request read size 512 is bounded by 1055.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1055;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0036
     * @tc.name      testSafeRequestTail0036
     * @tc.desc      Request read size 512 is bounded by 1086.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1086;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0037
     * @tc.name      testSafeRequestTail0037
     * @tc.desc      Request read size 512 is bounded by 1117.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1117;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0038
     * @tc.name      testSafeRequestTail0038
     * @tc.desc      Request read size 512 is bounded by 1148.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1148;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0039
     * @tc.name      testSafeRequestTail0039
     * @tc.desc      Request read size 512 is bounded by 1179.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1179;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0040
     * @tc.name      testSafeRequestTail0040
     * @tc.desc      Request read size 512 is bounded by 1210.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1210;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0041
     * @tc.name      testSafeRequestTail0041
     * @tc.desc      Request read size 512 is bounded by 1241.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1241;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0042
     * @tc.name      testSafeRequestTail0042
     * @tc.desc      Request read size 512 is bounded by 1272.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1272;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0043
     * @tc.name      testSafeRequestTail0043
     * @tc.desc      Request read size 512 is bounded by 1303.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1303;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0044
     * @tc.name      testSafeRequestTail0044
     * @tc.desc      Request read size 512 is bounded by 1334.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1334;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0045
     * @tc.name      testSafeRequestTail0045
     * @tc.desc      Request read size 512 is bounded by 1365.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1365;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0046
     * @tc.name      testSafeRequestTail0046
     * @tc.desc      Request read size 512 is bounded by 1396.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1396;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0047
     * @tc.name      testSafeRequestTail0047
     * @tc.desc      Request read size 512 is bounded by 1427.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1427;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0048
     * @tc.name      testSafeRequestTail0048
     * @tc.desc      Request read size 512 is bounded by 1458.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1458;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0049
     * @tc.name      testSafeRequestTail0049
     * @tc.desc      Request read size 512 is bounded by 1489.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1489;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0050
     * @tc.name      testSafeRequestTail0050
     * @tc.desc      Request read size 512 is bounded by 1520.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1520;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0051
     * @tc.name      testSafeRequestTail0051
     * @tc.desc      Request read size 512 is bounded by 1551.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1551;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0052
     * @tc.name      testSafeRequestTail0052
     * @tc.desc      Request read size 512 is bounded by 1582.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1582;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0053
     * @tc.name      testSafeRequestTail0053
     * @tc.desc      Request read size 512 is bounded by 1613.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1613;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0054
     * @tc.name      testSafeRequestTail0054
     * @tc.desc      Request read size 512 is bounded by 1644.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1644;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0055
     * @tc.name      testSafeRequestTail0055
     * @tc.desc      Request read size 512 is bounded by 1675.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1675;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0056
     * @tc.name      testSafeRequestTail0056
     * @tc.desc      Request read size 512 is bounded by 1706.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1706;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0057
     * @tc.name      testSafeRequestTail0057
     * @tc.desc      Request read size 512 is bounded by 1737.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1737;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0058
     * @tc.name      testSafeRequestTail0058
     * @tc.desc      Request read size 512 is bounded by 1768.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1768;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0059
     * @tc.name      testSafeRequestTail0059
     * @tc.desc      Request read size 512 is bounded by 1799.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1799;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0060
     * @tc.name      testSafeRequestTail0060
     * @tc.desc      Request read size 512 is bounded by 1830.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1830;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0061
     * @tc.name      testSafeRequestTail0061
     * @tc.desc      Request read size 512 is bounded by 1861.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1861;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0062
     * @tc.name      testSafeRequestTail0062
     * @tc.desc      Request read size 512 is bounded by 1892.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1892;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0063
     * @tc.name      testSafeRequestTail0063
     * @tc.desc      Request read size 512 is bounded by 1923.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1923;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0064
     * @tc.name      testSafeRequestTail0064
     * @tc.desc      Request read size 512 is bounded by 1954.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1954;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0065
     * @tc.name      testSafeRequestTail0065
     * @tc.desc      Request read size 512 is bounded by 1985.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1985;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0066
     * @tc.name      testSafeRequestTail0066
     * @tc.desc      Request read size 512 is bounded by 2016.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 2016;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0067
     * @tc.name      testSafeRequestTail0067
     * @tc.desc      Request read size 512 is bounded by 2047.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 2047;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0068
     * @tc.name      testSafeRequestTail0068
     * @tc.desc      Request read size 30 is bounded by 30.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 30;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(30);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0069
     * @tc.name      testSafeRequestTail0069
     * @tc.desc      Request read size 61 is bounded by 61.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 61;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(61);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0070
     * @tc.name      testSafeRequestTail0070
     * @tc.desc      Request read size 92 is bounded by 92.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 92;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(92);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0071
     * @tc.name      testSafeRequestTail0071
     * @tc.desc      Request read size 123 is bounded by 123.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 123;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(123);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0072
     * @tc.name      testSafeRequestTail0072
     * @tc.desc      Request read size 154 is bounded by 154.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 154;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(154);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0073
     * @tc.name      testSafeRequestTail0073
     * @tc.desc      Request read size 185 is bounded by 185.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 185;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(185);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0074
     * @tc.name      testSafeRequestTail0074
     * @tc.desc      Request read size 216 is bounded by 216.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 216;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(216);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0075
     * @tc.name      testSafeRequestTail0075
     * @tc.desc      Request read size 247 is bounded by 247.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 247;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(247);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0076
     * @tc.name      testSafeRequestTail0076
     * @tc.desc      Request read size 278 is bounded by 278.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 278;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(278);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0077
     * @tc.name      testSafeRequestTail0077
     * @tc.desc      Request read size 309 is bounded by 309.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 309;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(309);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0078
     * @tc.name      testSafeRequestTail0078
     * @tc.desc      Request read size 340 is bounded by 340.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 340;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(340);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0079
     * @tc.name      testSafeRequestTail0079
     * @tc.desc      Request read size 371 is bounded by 371.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 371;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(371);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0080
     * @tc.name      testSafeRequestTail0080
     * @tc.desc      Request read size 402 is bounded by 402.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 402;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(402);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0081
     * @tc.name      testSafeRequestTail0081
     * @tc.desc      Request read size 433 is bounded by 433.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 433;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(433);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0082
     * @tc.name      testSafeRequestTail0082
     * @tc.desc      Request read size 464 is bounded by 464.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 464;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(464);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0083
     * @tc.name      testSafeRequestTail0083
     * @tc.desc      Request read size 495 is bounded by 495.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 495;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(495);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0084
     * @tc.name      testSafeRequestTail0084
     * @tc.desc      Request read size 512 is bounded by 526.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 526;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0085
     * @tc.name      testSafeRequestTail0085
     * @tc.desc      Request read size 512 is bounded by 557.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 557;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0086
     * @tc.name      testSafeRequestTail0086
     * @tc.desc      Request read size 512 is bounded by 588.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 588;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0087
     * @tc.name      testSafeRequestTail0087
     * @tc.desc      Request read size 512 is bounded by 619.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 619;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0088
     * @tc.name      testSafeRequestTail0088
     * @tc.desc      Request read size 512 is bounded by 650.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 650;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0089
     * @tc.name      testSafeRequestTail0089
     * @tc.desc      Request read size 512 is bounded by 681.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 681;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0090
     * @tc.name      testSafeRequestTail0090
     * @tc.desc      Request read size 512 is bounded by 712.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 712;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0091
     * @tc.name      testSafeRequestTail0091
     * @tc.desc      Request read size 512 is bounded by 743.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 743;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0092
     * @tc.name      testSafeRequestTail0092
     * @tc.desc      Request read size 512 is bounded by 774.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 774;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0093
     * @tc.name      testSafeRequestTail0093
     * @tc.desc      Request read size 512 is bounded by 805.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 805;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0094
     * @tc.name      testSafeRequestTail0094
     * @tc.desc      Request read size 512 is bounded by 836.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 836;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0095
     * @tc.name      testSafeRequestTail0095
     * @tc.desc      Request read size 512 is bounded by 867.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 867;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0096
     * @tc.name      testSafeRequestTail0096
     * @tc.desc      Request read size 512 is bounded by 898.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 898;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0097
     * @tc.name      testSafeRequestTail0097
     * @tc.desc      Request read size 512 is bounded by 929.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 929;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0098
     * @tc.name      testSafeRequestTail0098
     * @tc.desc      Request read size 512 is bounded by 960.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 960;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0099
     * @tc.name      testSafeRequestTail0099
     * @tc.desc      Request read size 512 is bounded by 991.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 991;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RQT_0100
     * @tc.name      testSafeRequestTail0100
     * @tc.desc      Request read size 512 is bounded by 1022.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRequestTail0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const length: number = 1022;
      const readSize: number = Math.min(length, 512);
      expect(readSize).assertEqual(512);
      expect(readSize).assertLarger(0);
      expect(readSize).assertLessOrEqual(length);
      expect(length).assertLarger(0);
    })
  })
}
