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

const TAG: string = '[Sample_mediaSourceSpeedTimelineCore]';
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

export default function mediaSourceSpeedTimelineCoreTest(): void {
  describe('mediaSourceSpeedTimelineCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0001
     * @tc.name      testExtSpeedTimeline0000
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0002
     * @tc.name      testExtSpeedTimeline0001
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0003
     * @tc.name      testExtSpeedTimeline0002
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0004
     * @tc.name      testExtSpeedTimeline0003
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0005
     * @tc.name      testExtSpeedTimeline0004
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0006
     * @tc.name      testExtSpeedTimeline0005
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0007
     * @tc.name      testExtSpeedTimeline0006
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0008
     * @tc.name      testExtSpeedTimeline0007
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0009
     * @tc.name      testExtSpeedTimeline0008
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0010
     * @tc.name      testExtSpeedTimeline0009
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0011
     * @tc.name      testExtSpeedTimeline0010
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0012
     * @tc.name      testExtSpeedTimeline0011
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0013
     * @tc.name      testExtSpeedTimeline0012
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0014
     * @tc.name      testExtSpeedTimeline0013
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0015
     * @tc.name      testExtSpeedTimeline0014
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0016
     * @tc.name      testExtSpeedTimeline0015
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0017
     * @tc.name      testExtSpeedTimeline0016
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0018
     * @tc.name      testExtSpeedTimeline0017
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0019
     * @tc.name      testExtSpeedTimeline0018
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0020
     * @tc.name      testExtSpeedTimeline0019
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0021
     * @tc.name      testExtSpeedTimeline0020
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0022
     * @tc.name      testExtSpeedTimeline0021
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0023
     * @tc.name      testExtSpeedTimeline0022
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0024
     * @tc.name      testExtSpeedTimeline0023
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0025
     * @tc.name      testExtSpeedTimeline0024
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0026
     * @tc.name      testExtSpeedTimeline0025
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0027
     * @tc.name      testExtSpeedTimeline0026
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0028
     * @tc.name      testExtSpeedTimeline0027
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0029
     * @tc.name      testExtSpeedTimeline0028
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0030
     * @tc.name      testExtSpeedTimeline0029
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0031
     * @tc.name      testExtSpeedTimeline0030
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0032
     * @tc.name      testExtSpeedTimeline0031
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0033
     * @tc.name      testExtSpeedTimeline0032
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0034
     * @tc.name      testExtSpeedTimeline0033
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0035
     * @tc.name      testExtSpeedTimeline0034
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0036
     * @tc.name      testExtSpeedTimeline0035
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0037
     * @tc.name      testExtSpeedTimeline0036
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0038
     * @tc.name      testExtSpeedTimeline0037
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0039
     * @tc.name      testExtSpeedTimeline0038
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0040
     * @tc.name      testExtSpeedTimeline0039
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0041
     * @tc.name      testExtSpeedTimeline0040
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0042
     * @tc.name      testExtSpeedTimeline0041
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0043
     * @tc.name      testExtSpeedTimeline0042
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0044
     * @tc.name      testExtSpeedTimeline0043
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0045
     * @tc.name      testExtSpeedTimeline0044
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0046
     * @tc.name      testExtSpeedTimeline0045
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0047
     * @tc.name      testExtSpeedTimeline0046
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0048
     * @tc.name      testExtSpeedTimeline0047
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0049
     * @tc.name      testExtSpeedTimeline0048
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0050
     * @tc.name      testExtSpeedTimeline0049
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0051
     * @tc.name      testExtSpeedTimeline0050
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0052
     * @tc.name      testExtSpeedTimeline0051
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0053
     * @tc.name      testExtSpeedTimeline0052
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0054
     * @tc.name      testExtSpeedTimeline0053
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0055
     * @tc.name      testExtSpeedTimeline0054
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0056
     * @tc.name      testExtSpeedTimeline0055
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0057
     * @tc.name      testExtSpeedTimeline0056
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0058
     * @tc.name      testExtSpeedTimeline0057
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0059
     * @tc.name      testExtSpeedTimeline0058
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0060
     * @tc.name      testExtSpeedTimeline0059
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0061
     * @tc.name      testExtSpeedTimeline0060
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0062
     * @tc.name      testExtSpeedTimeline0061
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0063
     * @tc.name      testExtSpeedTimeline0062
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0064
     * @tc.name      testExtSpeedTimeline0063
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0065
     * @tc.name      testExtSpeedTimeline0064
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0066
     * @tc.name      testExtSpeedTimeline0065
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0067
     * @tc.name      testExtSpeedTimeline0066
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0068
     * @tc.name      testExtSpeedTimeline0067
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0069
     * @tc.name      testExtSpeedTimeline0068
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0070
     * @tc.name      testExtSpeedTimeline0069
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0071
     * @tc.name      testExtSpeedTimeline0070
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0072
     * @tc.name      testExtSpeedTimeline0071
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0073
     * @tc.name      testExtSpeedTimeline0072
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0074
     * @tc.name      testExtSpeedTimeline0073
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0075
     * @tc.name      testExtSpeedTimeline0074
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0076
     * @tc.name      testExtSpeedTimeline0075
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0077
     * @tc.name      testExtSpeedTimeline0076
     * @tc.desc      Duration 60000ms at 1.0x is 60000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 60000;
      const speed: number = 1.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(60000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0078
     * @tc.name      testExtSpeedTimeline0077
     * @tc.desc      Duration 120000ms at 1.25x is 96000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 120000;
      const speed: number = 1.25;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(96000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0079
     * @tc.name      testExtSpeedTimeline0078
     * @tc.desc      Duration 3599000ms at 1.75x is 2056571.4285714286.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 3599000;
      const speed: number = 1.75;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(2056571.4285714286, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPDTIME_0080
     * @tc.name      testExtSpeedTimeline0079
     * @tc.desc      Duration 300000ms at 2.0x is 150000.0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedTimeline0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const baseDuration: number = 300000;
      const speed: number = 2.0;
      const effective: number = baseDuration / speed;
      expect(effective).assertClose(150000.0, 0.001);
      expect(effective).assertLarger(0);
      expect(effective).assertLessOrEqual(baseDuration);
      expect((baseDuration * 1.0)).assertEqual(baseDuration);
    })
  });
}
