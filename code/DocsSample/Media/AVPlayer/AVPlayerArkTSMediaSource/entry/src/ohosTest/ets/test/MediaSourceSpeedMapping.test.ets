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
import { media } from '@kit.MediaKit';

const TAG: string = '[Sample_MediaSourceSpeedMapping]';
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

export default function mediaSourceSpeedMappingTest(): void {
  describe('mediaSourceSpeedMappingTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0001
     * @tc.name      testExtSpeedMapping0000
     * @tc.desc      Speed select -1 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = -1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0002
     * @tc.name      testExtSpeedMapping0001
     * @tc.desc      Speed select 0 maps to playback speed 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 0;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0003
     * @tc.name      testExtSpeedMapping0002
     * @tc.desc      Speed select 1 maps to playback speed 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(2);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0004
     * @tc.name      testExtSpeedMapping0003
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0005
     * @tc.name      testExtSpeedMapping0004
     * @tc.desc      Speed select 3 maps to playback speed 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 3;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(4);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0006
     * @tc.name      testExtSpeedMapping0005
     * @tc.desc      Speed select 4 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 4;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0007
     * @tc.name      testExtSpeedMapping0006
     * @tc.desc      Speed select 5 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 5;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0008
     * @tc.name      testExtSpeedMapping0007
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0009
     * @tc.name      testExtSpeedMapping0008
     * @tc.desc      Speed select -1 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = -1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0010
     * @tc.name      testExtSpeedMapping0009
     * @tc.desc      Speed select 0 maps to playback speed 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 0;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0011
     * @tc.name      testExtSpeedMapping0010
     * @tc.desc      Speed select 1 maps to playback speed 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(2);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0012
     * @tc.name      testExtSpeedMapping0011
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0013
     * @tc.name      testExtSpeedMapping0012
     * @tc.desc      Speed select 3 maps to playback speed 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 3;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(4);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0014
     * @tc.name      testExtSpeedMapping0013
     * @tc.desc      Speed select 4 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 4;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0015
     * @tc.name      testExtSpeedMapping0014
     * @tc.desc      Speed select 5 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 5;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0016
     * @tc.name      testExtSpeedMapping0015
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0017
     * @tc.name      testExtSpeedMapping0016
     * @tc.desc      Speed select -1 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = -1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0018
     * @tc.name      testExtSpeedMapping0017
     * @tc.desc      Speed select 0 maps to playback speed 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 0;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0019
     * @tc.name      testExtSpeedMapping0018
     * @tc.desc      Speed select 1 maps to playback speed 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(2);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0020
     * @tc.name      testExtSpeedMapping0019
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0021
     * @tc.name      testExtSpeedMapping0020
     * @tc.desc      Speed select 3 maps to playback speed 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 3;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(4);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0022
     * @tc.name      testExtSpeedMapping0021
     * @tc.desc      Speed select 4 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 4;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0023
     * @tc.name      testExtSpeedMapping0022
     * @tc.desc      Speed select 5 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 5;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0024
     * @tc.name      testExtSpeedMapping0023
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0025
     * @tc.name      testExtSpeedMapping0024
     * @tc.desc      Speed select -1 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = -1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0026
     * @tc.name      testExtSpeedMapping0025
     * @tc.desc      Speed select 0 maps to playback speed 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 0;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0027
     * @tc.name      testExtSpeedMapping0026
     * @tc.desc      Speed select 1 maps to playback speed 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(2);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0028
     * @tc.name      testExtSpeedMapping0027
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0029
     * @tc.name      testExtSpeedMapping0028
     * @tc.desc      Speed select 3 maps to playback speed 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 3;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(4);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0030
     * @tc.name      testExtSpeedMapping0029
     * @tc.desc      Speed select 4 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 4;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0031
     * @tc.name      testExtSpeedMapping0030
     * @tc.desc      Speed select 5 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 5;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0032
     * @tc.name      testExtSpeedMapping0031
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0033
     * @tc.name      testExtSpeedMapping0032
     * @tc.desc      Speed select -1 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = -1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0034
     * @tc.name      testExtSpeedMapping0033
     * @tc.desc      Speed select 0 maps to playback speed 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 0;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0035
     * @tc.name      testExtSpeedMapping0034
     * @tc.desc      Speed select 1 maps to playback speed 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(2);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0036
     * @tc.name      testExtSpeedMapping0035
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0037
     * @tc.name      testExtSpeedMapping0036
     * @tc.desc      Speed select 3 maps to playback speed 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 3;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(4);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0038
     * @tc.name      testExtSpeedMapping0037
     * @tc.desc      Speed select 4 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 4;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0039
     * @tc.name      testExtSpeedMapping0038
     * @tc.desc      Speed select 5 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 5;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0040
     * @tc.name      testExtSpeedMapping0039
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0041
     * @tc.name      testExtSpeedMapping0040
     * @tc.desc      Speed select -1 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = -1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0042
     * @tc.name      testExtSpeedMapping0041
     * @tc.desc      Speed select 0 maps to playback speed 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 0;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0043
     * @tc.name      testExtSpeedMapping0042
     * @tc.desc      Speed select 1 maps to playback speed 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(2);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0044
     * @tc.name      testExtSpeedMapping0043
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0045
     * @tc.name      testExtSpeedMapping0044
     * @tc.desc      Speed select 3 maps to playback speed 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 3;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(4);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0046
     * @tc.name      testExtSpeedMapping0045
     * @tc.desc      Speed select 4 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 4;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0047
     * @tc.name      testExtSpeedMapping0046
     * @tc.desc      Speed select 5 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 5;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0048
     * @tc.name      testExtSpeedMapping0047
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0049
     * @tc.name      testExtSpeedMapping0048
     * @tc.desc      Speed select -1 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = -1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0050
     * @tc.name      testExtSpeedMapping0049
     * @tc.desc      Speed select 0 maps to playback speed 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 0;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0051
     * @tc.name      testExtSpeedMapping0050
     * @tc.desc      Speed select 1 maps to playback speed 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(2);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0052
     * @tc.name      testExtSpeedMapping0051
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0053
     * @tc.name      testExtSpeedMapping0052
     * @tc.desc      Speed select 3 maps to playback speed 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 3;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(4);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0054
     * @tc.name      testExtSpeedMapping0053
     * @tc.desc      Speed select 4 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 4;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0055
     * @tc.name      testExtSpeedMapping0054
     * @tc.desc      Speed select 5 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 5;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0056
     * @tc.name      testExtSpeedMapping0055
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0057
     * @tc.name      testExtSpeedMapping0056
     * @tc.desc      Speed select -1 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = -1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0058
     * @tc.name      testExtSpeedMapping0057
     * @tc.desc      Speed select 0 maps to playback speed 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 0;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0059
     * @tc.name      testExtSpeedMapping0058
     * @tc.desc      Speed select 1 maps to playback speed 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(2);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0060
     * @tc.name      testExtSpeedMapping0059
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0061
     * @tc.name      testExtSpeedMapping0060
     * @tc.desc      Speed select 3 maps to playback speed 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 3;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(4);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0062
     * @tc.name      testExtSpeedMapping0061
     * @tc.desc      Speed select 4 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 4;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0063
     * @tc.name      testExtSpeedMapping0062
     * @tc.desc      Speed select 5 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 5;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0064
     * @tc.name      testExtSpeedMapping0063
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0065
     * @tc.name      testExtSpeedMapping0064
     * @tc.desc      Speed select -1 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = -1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0066
     * @tc.name      testExtSpeedMapping0065
     * @tc.desc      Speed select 0 maps to playback speed 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 0;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0067
     * @tc.name      testExtSpeedMapping0066
     * @tc.desc      Speed select 1 maps to playback speed 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 1;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(2);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0068
     * @tc.name      testExtSpeedMapping0067
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0069
     * @tc.name      testExtSpeedMapping0068
     * @tc.desc      Speed select 3 maps to playback speed 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 3;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(4);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0070
     * @tc.name      testExtSpeedMapping0069
     * @tc.desc      Speed select 4 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 4;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0071
     * @tc.name      testExtSpeedMapping0070
     * @tc.desc      Speed select 5 maps to playback speed -1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 5;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(-1);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_SPEEDMAP_0072
     * @tc.name      testExtSpeedMapping0071
     * @tc.desc      Speed select 2 maps to playback speed 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtSpeedMapping0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const speedSelect: number = 2;
      let mapped: number = -1;
      if (speedSelect === 0) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
      } else if (speedSelect === 1) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
      } else if (speedSelect === 2) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
      } else if (speedSelect === 3) {
        mapped = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
      }
      expect(mapped).assertEqual(3);
      expect(mapped >= -1).assertTrue();
      expect(mapped <= 4).assertTrue();
    })
  });
}
