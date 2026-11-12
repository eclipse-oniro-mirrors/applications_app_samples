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

const TAG: string = '[Sample_audioFocusControllerNegative]';
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

export default function audioFocusControllerNegativeTest(): void {
  describe('audioFocusControllerNegativeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0001
     * @tc.name      testExtFocusNeg0000
     * @tc.desc      Controller startPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.startPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0002
     * @tc.name      testExtFocusNeg0001
     * @tc.desc      Controller pausePlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.pausePlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0003
     * @tc.name      testExtFocusNeg0002
     * @tc.desc      Controller stopPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.stopPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0004
     * @tc.name      testExtFocusNeg0003
     * @tc.desc      Controller release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.release();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0005
     * @tc.name      testExtFocusNeg0004
     * @tc.desc      Controller clearInterruptLog before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.clearInterruptLog();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0006
     * @tc.name      testExtFocusNeg0005
     * @tc.desc      Controller startPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.startPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0007
     * @tc.name      testExtFocusNeg0006
     * @tc.desc      Controller pausePlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.pausePlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0008
     * @tc.name      testExtFocusNeg0007
     * @tc.desc      Controller stopPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.stopPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0009
     * @tc.name      testExtFocusNeg0008
     * @tc.desc      Controller release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.release();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0010
     * @tc.name      testExtFocusNeg0009
     * @tc.desc      Controller clearInterruptLog before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.clearInterruptLog();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0011
     * @tc.name      testExtFocusNeg0010
     * @tc.desc      Controller startPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.startPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0012
     * @tc.name      testExtFocusNeg0011
     * @tc.desc      Controller pausePlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.pausePlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0013
     * @tc.name      testExtFocusNeg0012
     * @tc.desc      Controller stopPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.stopPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0014
     * @tc.name      testExtFocusNeg0013
     * @tc.desc      Controller release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.release();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0015
     * @tc.name      testExtFocusNeg0014
     * @tc.desc      Controller clearInterruptLog before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.clearInterruptLog();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0016
     * @tc.name      testExtFocusNeg0015
     * @tc.desc      Controller startPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.startPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0017
     * @tc.name      testExtFocusNeg0016
     * @tc.desc      Controller pausePlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.pausePlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0018
     * @tc.name      testExtFocusNeg0017
     * @tc.desc      Controller stopPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.stopPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0019
     * @tc.name      testExtFocusNeg0018
     * @tc.desc      Controller release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.release();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0020
     * @tc.name      testExtFocusNeg0019
     * @tc.desc      Controller clearInterruptLog before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.clearInterruptLog();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0021
     * @tc.name      testExtFocusNeg0020
     * @tc.desc      Controller startPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.startPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0022
     * @tc.name      testExtFocusNeg0021
     * @tc.desc      Controller pausePlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.pausePlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0023
     * @tc.name      testExtFocusNeg0022
     * @tc.desc      Controller stopPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.stopPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0024
     * @tc.name      testExtFocusNeg0023
     * @tc.desc      Controller release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.release();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0025
     * @tc.name      testExtFocusNeg0024
     * @tc.desc      Controller clearInterruptLog before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.clearInterruptLog();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0026
     * @tc.name      testExtFocusNeg0025
     * @tc.desc      Controller startPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.startPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0027
     * @tc.name      testExtFocusNeg0026
     * @tc.desc      Controller pausePlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.pausePlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0028
     * @tc.name      testExtFocusNeg0027
     * @tc.desc      Controller stopPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.stopPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0029
     * @tc.name      testExtFocusNeg0028
     * @tc.desc      Controller release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.release();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0030
     * @tc.name      testExtFocusNeg0029
     * @tc.desc      Controller clearInterruptLog before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.clearInterruptLog();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0031
     * @tc.name      testExtFocusNeg0030
     * @tc.desc      Controller startPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.startPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0032
     * @tc.name      testExtFocusNeg0031
     * @tc.desc      Controller pausePlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.pausePlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0033
     * @tc.name      testExtFocusNeg0032
     * @tc.desc      Controller stopPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.stopPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0034
     * @tc.name      testExtFocusNeg0033
     * @tc.desc      Controller release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.release();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0035
     * @tc.name      testExtFocusNeg0034
     * @tc.desc      Controller clearInterruptLog before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.clearInterruptLog();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0036
     * @tc.name      testExtFocusNeg0035
     * @tc.desc      Controller startPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.startPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0037
     * @tc.name      testExtFocusNeg0036
     * @tc.desc      Controller pausePlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.pausePlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0038
     * @tc.name      testExtFocusNeg0037
     * @tc.desc      Controller stopPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.stopPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0039
     * @tc.name      testExtFocusNeg0038
     * @tc.desc      Controller release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.release();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0040
     * @tc.name      testExtFocusNeg0039
     * @tc.desc      Controller clearInterruptLog before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.clearInterruptLog();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0041
     * @tc.name      testExtFocusNeg0040
     * @tc.desc      Controller startPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.startPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0042
     * @tc.name      testExtFocusNeg0041
     * @tc.desc      Controller pausePlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.pausePlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0043
     * @tc.name      testExtFocusNeg0042
     * @tc.desc      Controller stopPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.stopPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0044
     * @tc.name      testExtFocusNeg0043
     * @tc.desc      Controller release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.release();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0045
     * @tc.name      testExtFocusNeg0044
     * @tc.desc      Controller clearInterruptLog before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.clearInterruptLog();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0046
     * @tc.name      testExtFocusNeg0045
     * @tc.desc      Controller startPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.startPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0047
     * @tc.name      testExtFocusNeg0046
     * @tc.desc      Controller pausePlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.pausePlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0048
     * @tc.name      testExtFocusNeg0047
     * @tc.desc      Controller stopPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.stopPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0049
     * @tc.name      testExtFocusNeg0048
     * @tc.desc      Controller release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.release();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0050
     * @tc.name      testExtFocusNeg0049
     * @tc.desc      Controller clearInterruptLog before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.clearInterruptLog();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0051
     * @tc.name      testExtFocusNeg0050
     * @tc.desc      Controller startPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.startPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0052
     * @tc.name      testExtFocusNeg0051
     * @tc.desc      Controller pausePlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.pausePlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0053
     * @tc.name      testExtFocusNeg0052
     * @tc.desc      Controller stopPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.stopPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0054
     * @tc.name      testExtFocusNeg0053
     * @tc.desc      Controller release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.release();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0055
     * @tc.name      testExtFocusNeg0054
     * @tc.desc      Controller clearInterruptLog before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.clearInterruptLog();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0056
     * @tc.name      testExtFocusNeg0055
     * @tc.desc      Controller startPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.startPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0057
     * @tc.name      testExtFocusNeg0056
     * @tc.desc      Controller pausePlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.pausePlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0058
     * @tc.name      testExtFocusNeg0057
     * @tc.desc      Controller stopPlay before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.stopPlay();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0059
     * @tc.name      testExtFocusNeg0058
     * @tc.desc      Controller release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.release();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_NEG_0060
     * @tc.name      testExtFocusNeg0059
     * @tc.desc      Controller clearInterruptLog before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusNeg0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC);
      await controller.clearInterruptLog();
      expect(controller.getIsPlaying()).assertFalse();
      expect(controller.getInterruptLog().length).assertEqual(0);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
  });
}
