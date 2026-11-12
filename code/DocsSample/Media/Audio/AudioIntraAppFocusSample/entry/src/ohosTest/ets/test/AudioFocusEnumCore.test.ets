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
import { InterruptMode, AudioStreamState, StreamUsageType } from '../../../main/ets/common/constants/AudioConstants';
import { AudioStreamController } from '../../../main/ets/common/utils/AudioStreamController';

const TAG: string = '[Sample_audioFocusEnumCore]';
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

export default function audioFocusEnumCoreTest(): void {
  describe('audioFocusEnumCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0001
     * @tc.name      testExtFocusEnum0000
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0002
     * @tc.name      testExtFocusEnum0001
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0003
     * @tc.name      testExtFocusEnum0002
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0004
     * @tc.name      testExtFocusEnum0003
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0005
     * @tc.name      testExtFocusEnum0004
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0006
     * @tc.name      testExtFocusEnum0005
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0007
     * @tc.name      testExtFocusEnum0006
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0008
     * @tc.name      testExtFocusEnum0007
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0009
     * @tc.name      testExtFocusEnum0008
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0010
     * @tc.name      testExtFocusEnum0009
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0011
     * @tc.name      testExtFocusEnum0010
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0012
     * @tc.name      testExtFocusEnum0011
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0013
     * @tc.name      testExtFocusEnum0012
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0014
     * @tc.name      testExtFocusEnum0013
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0015
     * @tc.name      testExtFocusEnum0014
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0016
     * @tc.name      testExtFocusEnum0015
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0017
     * @tc.name      testExtFocusEnum0016
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0018
     * @tc.name      testExtFocusEnum0017
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0019
     * @tc.name      testExtFocusEnum0018
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0020
     * @tc.name      testExtFocusEnum0019
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0021
     * @tc.name      testExtFocusEnum0020
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0022
     * @tc.name      testExtFocusEnum0021
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0023
     * @tc.name      testExtFocusEnum0022
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0024
     * @tc.name      testExtFocusEnum0023
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0025
     * @tc.name      testExtFocusEnum0024
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0026
     * @tc.name      testExtFocusEnum0025
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0027
     * @tc.name      testExtFocusEnum0026
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0028
     * @tc.name      testExtFocusEnum0027
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0029
     * @tc.name      testExtFocusEnum0028
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0030
     * @tc.name      testExtFocusEnum0029
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0031
     * @tc.name      testExtFocusEnum0030
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0032
     * @tc.name      testExtFocusEnum0031
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0033
     * @tc.name      testExtFocusEnum0032
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0034
     * @tc.name      testExtFocusEnum0033
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0035
     * @tc.name      testExtFocusEnum0034
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0036
     * @tc.name      testExtFocusEnum0035
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0037
     * @tc.name      testExtFocusEnum0036
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0038
     * @tc.name      testExtFocusEnum0037
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0039
     * @tc.name      testExtFocusEnum0038
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0040
     * @tc.name      testExtFocusEnum0039
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0041
     * @tc.name      testExtFocusEnum0040
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0042
     * @tc.name      testExtFocusEnum0041
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0043
     * @tc.name      testExtFocusEnum0042
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0044
     * @tc.name      testExtFocusEnum0043
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0045
     * @tc.name      testExtFocusEnum0044
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0046
     * @tc.name      testExtFocusEnum0045
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0047
     * @tc.name      testExtFocusEnum0046
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0048
     * @tc.name      testExtFocusEnum0047
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0049
     * @tc.name      testExtFocusEnum0048
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0050
     * @tc.name      testExtFocusEnum0049
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0051
     * @tc.name      testExtFocusEnum0050
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0052
     * @tc.name      testExtFocusEnum0051
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0053
     * @tc.name      testExtFocusEnum0052
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0054
     * @tc.name      testExtFocusEnum0053
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0055
     * @tc.name      testExtFocusEnum0054
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0056
     * @tc.name      testExtFocusEnum0055
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0057
     * @tc.name      testExtFocusEnum0056
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0058
     * @tc.name      testExtFocusEnum0057
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0059
     * @tc.name      testExtFocusEnum0058
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0060
     * @tc.name      testExtFocusEnum0059
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0061
     * @tc.name      testExtFocusEnum0060
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0062
     * @tc.name      testExtFocusEnum0061
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0063
     * @tc.name      testExtFocusEnum0062
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0064
     * @tc.name      testExtFocusEnum0063
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0065
     * @tc.name      testExtFocusEnum0064
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0066
     * @tc.name      testExtFocusEnum0065
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0067
     * @tc.name      testExtFocusEnum0066
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0068
     * @tc.name      testExtFocusEnum0067
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0069
     * @tc.name      testExtFocusEnum0068
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0070
     * @tc.name      testExtFocusEnum0069
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0071
     * @tc.name      testExtFocusEnum0070
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0072
     * @tc.name      testExtFocusEnum0071
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0073
     * @tc.name      testExtFocusEnum0072
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0074
     * @tc.name      testExtFocusEnum0073
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0075
     * @tc.name      testExtFocusEnum0074
     * @tc.desc      Enum/usage GAME.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(2 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('GAME');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0076
     * @tc.name      testExtFocusEnum0075
     * @tc.desc      Enum/usage AUDIOBOOK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(3 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('AUDIOBOOK');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0077
     * @tc.name      testExtFocusEnum0076
     * @tc.desc      Enum/usage NAVIGATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(4 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('NAVIGATION');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0078
     * @tc.name      testExtFocusEnum0077
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(99 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0079
     * @tc.name      testExtFocusEnum0078
     * @tc.desc      Enum/usage MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(0 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MUSIC');
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ENUM_0080
     * @tc.name      testExtFocusEnum0079
     * @tc.desc      Enum/usage MOVIE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusEnum0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      const controller: AudioStreamController = new AudioStreamController(1 as StreamUsageType);
      expect(controller.getStreamUsageName()).assertEqual('MOVIE');
    })
  });
}
