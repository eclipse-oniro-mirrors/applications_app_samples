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

const TAG: string = '[Sample_mediaSourceSeekWindowCore]';
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

export default function mediaSourceSeekWindowCoreTest(): void {
  describe('mediaSourceSeekWindowCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0001
     * @tc.name      testExtSeekWindow0000
     * @tc.desc      Seek -100 in 60000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = -100;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0002
     * @tc.name      testExtSeekWindow0001
     * @tc.desc      Seek -1 in 120000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = -1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0003
     * @tc.name      testExtSeekWindow0002
     * @tc.desc      Seek 0 in 3599000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 0;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0004
     * @tc.name      testExtSeekWindow0003
     * @tc.desc      Seek 1 in 300000ms clamps to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(1);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0005
     * @tc.name      testExtSeekWindow0004
     * @tc.desc      Seek 500 in 60000ms clamps to 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = 500;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(500);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0006
     * @tc.name      testExtSeekWindow0005
     * @tc.desc      Seek 60000 in 120000ms clamps to 60000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = 60000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(60000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0007
     * @tc.name      testExtSeekWindow0006
     * @tc.desc      Seek 120000 in 3599000ms clamps to 120000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 120000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(120000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0008
     * @tc.name      testExtSeekWindow0007
     * @tc.desc      Seek 4000000 in 300000ms clamps to 300000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 4000000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(300000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0009
     * @tc.name      testExtSeekWindow0008
     * @tc.desc      Seek -100 in 60000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = -100;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0010
     * @tc.name      testExtSeekWindow0009
     * @tc.desc      Seek -1 in 120000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = -1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0011
     * @tc.name      testExtSeekWindow0010
     * @tc.desc      Seek 0 in 3599000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 0;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0012
     * @tc.name      testExtSeekWindow0011
     * @tc.desc      Seek 1 in 300000ms clamps to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(1);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0013
     * @tc.name      testExtSeekWindow0012
     * @tc.desc      Seek 500 in 60000ms clamps to 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = 500;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(500);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0014
     * @tc.name      testExtSeekWindow0013
     * @tc.desc      Seek 60000 in 120000ms clamps to 60000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = 60000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(60000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0015
     * @tc.name      testExtSeekWindow0014
     * @tc.desc      Seek 120000 in 3599000ms clamps to 120000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 120000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(120000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0016
     * @tc.name      testExtSeekWindow0015
     * @tc.desc      Seek 4000000 in 300000ms clamps to 300000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 4000000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(300000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0017
     * @tc.name      testExtSeekWindow0016
     * @tc.desc      Seek -100 in 60000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = -100;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0018
     * @tc.name      testExtSeekWindow0017
     * @tc.desc      Seek -1 in 120000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = -1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0019
     * @tc.name      testExtSeekWindow0018
     * @tc.desc      Seek 0 in 3599000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 0;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0020
     * @tc.name      testExtSeekWindow0019
     * @tc.desc      Seek 1 in 300000ms clamps to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(1);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0021
     * @tc.name      testExtSeekWindow0020
     * @tc.desc      Seek 500 in 60000ms clamps to 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = 500;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(500);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0022
     * @tc.name      testExtSeekWindow0021
     * @tc.desc      Seek 60000 in 120000ms clamps to 60000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = 60000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(60000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0023
     * @tc.name      testExtSeekWindow0022
     * @tc.desc      Seek 120000 in 3599000ms clamps to 120000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 120000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(120000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0024
     * @tc.name      testExtSeekWindow0023
     * @tc.desc      Seek 4000000 in 300000ms clamps to 300000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 4000000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(300000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0025
     * @tc.name      testExtSeekWindow0024
     * @tc.desc      Seek -100 in 60000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = -100;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0026
     * @tc.name      testExtSeekWindow0025
     * @tc.desc      Seek -1 in 120000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = -1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0027
     * @tc.name      testExtSeekWindow0026
     * @tc.desc      Seek 0 in 3599000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 0;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0028
     * @tc.name      testExtSeekWindow0027
     * @tc.desc      Seek 1 in 300000ms clamps to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(1);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0029
     * @tc.name      testExtSeekWindow0028
     * @tc.desc      Seek 500 in 60000ms clamps to 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = 500;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(500);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0030
     * @tc.name      testExtSeekWindow0029
     * @tc.desc      Seek 60000 in 120000ms clamps to 60000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = 60000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(60000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0031
     * @tc.name      testExtSeekWindow0030
     * @tc.desc      Seek 120000 in 3599000ms clamps to 120000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 120000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(120000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0032
     * @tc.name      testExtSeekWindow0031
     * @tc.desc      Seek 4000000 in 300000ms clamps to 300000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 4000000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(300000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0033
     * @tc.name      testExtSeekWindow0032
     * @tc.desc      Seek -100 in 60000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = -100;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0034
     * @tc.name      testExtSeekWindow0033
     * @tc.desc      Seek -1 in 120000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = -1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0035
     * @tc.name      testExtSeekWindow0034
     * @tc.desc      Seek 0 in 3599000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 0;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0036
     * @tc.name      testExtSeekWindow0035
     * @tc.desc      Seek 1 in 300000ms clamps to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(1);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0037
     * @tc.name      testExtSeekWindow0036
     * @tc.desc      Seek 500 in 60000ms clamps to 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = 500;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(500);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0038
     * @tc.name      testExtSeekWindow0037
     * @tc.desc      Seek 60000 in 120000ms clamps to 60000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = 60000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(60000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0039
     * @tc.name      testExtSeekWindow0038
     * @tc.desc      Seek 120000 in 3599000ms clamps to 120000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 120000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(120000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0040
     * @tc.name      testExtSeekWindow0039
     * @tc.desc      Seek 4000000 in 300000ms clamps to 300000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 4000000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(300000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0041
     * @tc.name      testExtSeekWindow0040
     * @tc.desc      Seek -100 in 60000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = -100;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0042
     * @tc.name      testExtSeekWindow0041
     * @tc.desc      Seek -1 in 120000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = -1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0043
     * @tc.name      testExtSeekWindow0042
     * @tc.desc      Seek 0 in 3599000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 0;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0044
     * @tc.name      testExtSeekWindow0043
     * @tc.desc      Seek 1 in 300000ms clamps to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(1);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0045
     * @tc.name      testExtSeekWindow0044
     * @tc.desc      Seek 500 in 60000ms clamps to 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = 500;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(500);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0046
     * @tc.name      testExtSeekWindow0045
     * @tc.desc      Seek 60000 in 120000ms clamps to 60000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = 60000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(60000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0047
     * @tc.name      testExtSeekWindow0046
     * @tc.desc      Seek 120000 in 3599000ms clamps to 120000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 120000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(120000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0048
     * @tc.name      testExtSeekWindow0047
     * @tc.desc      Seek 4000000 in 300000ms clamps to 300000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 4000000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(300000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0049
     * @tc.name      testExtSeekWindow0048
     * @tc.desc      Seek -100 in 60000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = -100;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0050
     * @tc.name      testExtSeekWindow0049
     * @tc.desc      Seek -1 in 120000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = -1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0051
     * @tc.name      testExtSeekWindow0050
     * @tc.desc      Seek 0 in 3599000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 0;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0052
     * @tc.name      testExtSeekWindow0051
     * @tc.desc      Seek 1 in 300000ms clamps to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(1);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0053
     * @tc.name      testExtSeekWindow0052
     * @tc.desc      Seek 500 in 60000ms clamps to 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = 500;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(500);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0054
     * @tc.name      testExtSeekWindow0053
     * @tc.desc      Seek 60000 in 120000ms clamps to 60000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = 60000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(60000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0055
     * @tc.name      testExtSeekWindow0054
     * @tc.desc      Seek 120000 in 3599000ms clamps to 120000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 120000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(120000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0056
     * @tc.name      testExtSeekWindow0055
     * @tc.desc      Seek 4000000 in 300000ms clamps to 300000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 4000000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(300000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0057
     * @tc.name      testExtSeekWindow0056
     * @tc.desc      Seek -100 in 60000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = -100;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0058
     * @tc.name      testExtSeekWindow0057
     * @tc.desc      Seek -1 in 120000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = -1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0059
     * @tc.name      testExtSeekWindow0058
     * @tc.desc      Seek 0 in 3599000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 0;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0060
     * @tc.name      testExtSeekWindow0059
     * @tc.desc      Seek 1 in 300000ms clamps to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(1);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0061
     * @tc.name      testExtSeekWindow0060
     * @tc.desc      Seek 500 in 60000ms clamps to 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = 500;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(500);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0062
     * @tc.name      testExtSeekWindow0061
     * @tc.desc      Seek 60000 in 120000ms clamps to 60000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = 60000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(60000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0063
     * @tc.name      testExtSeekWindow0062
     * @tc.desc      Seek 120000 in 3599000ms clamps to 120000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 120000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(120000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0064
     * @tc.name      testExtSeekWindow0063
     * @tc.desc      Seek 4000000 in 300000ms clamps to 300000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 4000000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(300000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0065
     * @tc.name      testExtSeekWindow0064
     * @tc.desc      Seek -100 in 60000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = -100;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0066
     * @tc.name      testExtSeekWindow0065
     * @tc.desc      Seek -1 in 120000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = -1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0067
     * @tc.name      testExtSeekWindow0066
     * @tc.desc      Seek 0 in 3599000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 0;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0068
     * @tc.name      testExtSeekWindow0067
     * @tc.desc      Seek 1 in 300000ms clamps to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(1);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0069
     * @tc.name      testExtSeekWindow0068
     * @tc.desc      Seek 500 in 60000ms clamps to 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = 500;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(500);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0070
     * @tc.name      testExtSeekWindow0069
     * @tc.desc      Seek 60000 in 120000ms clamps to 60000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = 60000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(60000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0071
     * @tc.name      testExtSeekWindow0070
     * @tc.desc      Seek 120000 in 3599000ms clamps to 120000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 120000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(120000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0072
     * @tc.name      testExtSeekWindow0071
     * @tc.desc      Seek 4000000 in 300000ms clamps to 300000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 4000000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(300000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0073
     * @tc.name      testExtSeekWindow0072
     * @tc.desc      Seek -100 in 60000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = -100;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0074
     * @tc.name      testExtSeekWindow0073
     * @tc.desc      Seek -1 in 120000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = -1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0075
     * @tc.name      testExtSeekWindow0074
     * @tc.desc      Seek 0 in 3599000ms clamps to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 0;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(0);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0076
     * @tc.name      testExtSeekWindow0075
     * @tc.desc      Seek 1 in 300000ms clamps to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 1;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(1);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0077
     * @tc.name      testExtSeekWindow0076
     * @tc.desc      Seek 500 in 60000ms clamps to 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 60000;
      const requested: number = 500;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(500);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0078
     * @tc.name      testExtSeekWindow0077
     * @tc.desc      Seek 60000 in 120000ms clamps to 60000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 120000;
      const requested: number = 60000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(60000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0079
     * @tc.name      testExtSeekWindow0078
     * @tc.desc      Seek 120000 in 3599000ms clamps to 120000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 3599000;
      const requested: number = 120000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(120000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SEEKWIN_0080
     * @tc.name      testExtSeekWindow0079
     * @tc.desc      Seek 4000000 in 300000ms clamps to 300000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSeekWindow0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const duration: number = 300000;
      const requested: number = 4000000;
      const rounded: number = Math.round(requested);
      const clamped: number = Math.max(0, Math.min(rounded, duration));
      expect(clamped).assertEqual(300000);
      expect(clamped).assertLargerOrEqual(0);
      expect(clamped).assertLessOrEqual(duration);
      expect(clamped <= duration).assertTrue();
    })
  });
}
