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
import { AudioStreamController } from '../../../main/ets/common/utils/AudioStreamController';
import { StreamUsageType } from '../../../main/ets/common/constants/AudioConstants';

const TAG: string = '[Sample_audioFocusUsageMappingCore]';
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

export default function audioFocusUsageMappingCoreTest(): void {
  describe('audioFocusUsageMappingCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0001
     * @tc.name      testExtFocusUsage0000
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0002
     * @tc.name      testExtFocusUsage0001
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0003
     * @tc.name      testExtFocusUsage0002
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0004
     * @tc.name      testExtFocusUsage0003
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0005
     * @tc.name      testExtFocusUsage0004
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0006
     * @tc.name      testExtFocusUsage0005
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0007
     * @tc.name      testExtFocusUsage0006
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0008
     * @tc.name      testExtFocusUsage0007
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0009
     * @tc.name      testExtFocusUsage0008
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0010
     * @tc.name      testExtFocusUsage0009
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0011
     * @tc.name      testExtFocusUsage0010
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0012
     * @tc.name      testExtFocusUsage0011
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0013
     * @tc.name      testExtFocusUsage0012
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0014
     * @tc.name      testExtFocusUsage0013
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0015
     * @tc.name      testExtFocusUsage0014
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0016
     * @tc.name      testExtFocusUsage0015
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0017
     * @tc.name      testExtFocusUsage0016
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0018
     * @tc.name      testExtFocusUsage0017
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0019
     * @tc.name      testExtFocusUsage0018
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0020
     * @tc.name      testExtFocusUsage0019
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0021
     * @tc.name      testExtFocusUsage0020
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0022
     * @tc.name      testExtFocusUsage0021
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0023
     * @tc.name      testExtFocusUsage0022
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0024
     * @tc.name      testExtFocusUsage0023
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0025
     * @tc.name      testExtFocusUsage0024
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0026
     * @tc.name      testExtFocusUsage0025
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0027
     * @tc.name      testExtFocusUsage0026
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0028
     * @tc.name      testExtFocusUsage0027
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0029
     * @tc.name      testExtFocusUsage0028
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0030
     * @tc.name      testExtFocusUsage0029
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0031
     * @tc.name      testExtFocusUsage0030
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0032
     * @tc.name      testExtFocusUsage0031
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0033
     * @tc.name      testExtFocusUsage0032
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0034
     * @tc.name      testExtFocusUsage0033
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0035
     * @tc.name      testExtFocusUsage0034
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0036
     * @tc.name      testExtFocusUsage0035
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0037
     * @tc.name      testExtFocusUsage0036
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0038
     * @tc.name      testExtFocusUsage0037
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0039
     * @tc.name      testExtFocusUsage0038
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0040
     * @tc.name      testExtFocusUsage0039
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0041
     * @tc.name      testExtFocusUsage0040
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0042
     * @tc.name      testExtFocusUsage0041
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0043
     * @tc.name      testExtFocusUsage0042
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0044
     * @tc.name      testExtFocusUsage0043
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0045
     * @tc.name      testExtFocusUsage0044
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0046
     * @tc.name      testExtFocusUsage0045
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0047
     * @tc.name      testExtFocusUsage0046
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0048
     * @tc.name      testExtFocusUsage0047
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0049
     * @tc.name      testExtFocusUsage0048
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0050
     * @tc.name      testExtFocusUsage0049
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0051
     * @tc.name      testExtFocusUsage0050
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0052
     * @tc.name      testExtFocusUsage0051
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0053
     * @tc.name      testExtFocusUsage0052
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0054
     * @tc.name      testExtFocusUsage0053
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0055
     * @tc.name      testExtFocusUsage0054
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0056
     * @tc.name      testExtFocusUsage0055
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0057
     * @tc.name      testExtFocusUsage0056
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0058
     * @tc.name      testExtFocusUsage0057
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0059
     * @tc.name      testExtFocusUsage0058
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0060
     * @tc.name      testExtFocusUsage0059
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0061
     * @tc.name      testExtFocusUsage0060
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0062
     * @tc.name      testExtFocusUsage0061
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0063
     * @tc.name      testExtFocusUsage0062
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0064
     * @tc.name      testExtFocusUsage0063
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0065
     * @tc.name      testExtFocusUsage0064
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0066
     * @tc.name      testExtFocusUsage0065
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0067
     * @tc.name      testExtFocusUsage0066
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0068
     * @tc.name      testExtFocusUsage0067
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0069
     * @tc.name      testExtFocusUsage0068
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0070
     * @tc.name      testExtFocusUsage0069
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0071
     * @tc.name      testExtFocusUsage0070
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0072
     * @tc.name      testExtFocusUsage0071
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0073
     * @tc.name      testExtFocusUsage0072
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0074
     * @tc.name      testExtFocusUsage0073
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0075
     * @tc.name      testExtFocusUsage0074
     * @tc.desc      Stream usage GAME mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0076
     * @tc.name      testExtFocusUsage0075
     * @tc.desc      Stream usage AUDIOBOOK mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0077
     * @tc.name      testExtFocusUsage0076
     * @tc.desc      Stream usage NAVIGATION mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0078
     * @tc.name      testExtFocusUsage0077
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0079
     * @tc.name      testExtFocusUsage0078
     * @tc.desc      Stream usage MUSIC mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_USAGE_0080
     * @tc.name      testExtFocusUsage0079
     * @tc.desc      Stream usage MOVIE mapping.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUsage0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
    })
  });
}
