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
import { TestType, Size, Level } from '@ohos/hypium';

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { audio } from '@kit.AudioKit';
import { paceTurn } from '../Shared/TestPace';
import { hilog } from '@kit.PerformanceAnalysisKit';

const USAGES: audio.StreamUsage[] = [
  audio.StreamUsage.STREAM_USAGE_MEDIA,
  audio.StreamUsage.STREAM_USAGE_MUSIC,
  audio.StreamUsage.STREAM_USAGE_MOVIE,
  audio.StreamUsage.STREAM_USAGE_GAME,
  audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
  audio.StreamUsage.STREAM_USAGE_RINGTONE,
  audio.StreamUsage.STREAM_USAGE_ALARM
];

function manager(): audio.AudioVolumeManager {
  return audio.getAudioManager().getVolumeManager();
}

function assertRange(usage: audio.StreamUsage): void {
  const volumeManager: audio.AudioVolumeManager = manager();
  const min: number = volumeManager.getMinVolumeByStream(usage);
  const max: number = volumeManager.getMaxVolumeByStream(usage);
  const current: number = volumeManager.getVolumeByStream(usage);
  expect(min).assertLargerOrEqual(0);
  expect(max).assertLargerOrEqual(min);
  expect(current).assertLargerOrEqual(min);
  expect(current).assertLessOrEqual(max);
  expect(Number.isInteger(min)).assertTrue();
  expect(Number.isInteger(max)).assertTrue();
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_Audio_AudioVolumeStreamMatrix]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function audioVolumeStreamMatrixTest() {
  describe('audioVolumeStreamMatrixTest', () => {
    beforeAll(() => {
      console.info('audioVolumeStreamMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('audioVolumeStreamMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_STREAM_0100
     * @tc.name      testAudioVolumeStream0001
     * @tc.desc      Verify the media stream volume range contains the current media volume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeStream0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testAudioVolumeStream0001');
      assertRange(audio.StreamUsage.STREAM_USAGE_MEDIA);
    
      logEnd('testAudioVolumeStream0001');
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_STREAM_0200
     * @tc.name      testAudioVolumeStream0002
     * @tc.desc      Verify the music stream volume range contains the current music volume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeStream0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testAudioVolumeStream0002');
      assertRange(audio.StreamUsage.STREAM_USAGE_MUSIC);
    
      logEnd('testAudioVolumeStream0002');
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_STREAM_0300
     * @tc.name      testAudioVolumeStream0003
     * @tc.desc      Verify the movie stream volume range contains the current movie volume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeStream0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testAudioVolumeStream0003');
      assertRange(audio.StreamUsage.STREAM_USAGE_MOVIE);
    
      logEnd('testAudioVolumeStream0003');
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_STREAM_0400
     * @tc.name      testAudioVolumeStream0004
     * @tc.desc      Verify the game stream volume range contains the current game volume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeStream0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testAudioVolumeStream0004');
      assertRange(audio.StreamUsage.STREAM_USAGE_GAME);
    
      logEnd('testAudioVolumeStream0004');
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_STREAM_0500
     * @tc.name      testAudioVolumeStream0005
     * @tc.desc      Verify the notification stream volume range contains the current notification volume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeStream0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testAudioVolumeStream0005');
      assertRange(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
    
      logEnd('testAudioVolumeStream0005');
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_STREAM_0600
     * @tc.name      testAudioVolumeStream0006
     * @tc.desc      Verify the ringtone stream volume range contains the current ringtone volume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeStream0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testAudioVolumeStream0006');
      assertRange(audio.StreamUsage.STREAM_USAGE_RINGTONE);
    
      logEnd('testAudioVolumeStream0006');
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_STREAM_0700
     * @tc.name      testAudioVolumeStream0007
     * @tc.desc      Verify the alarm stream volume range contains the current alarm volume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeStream0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testAudioVolumeStream0007');
      assertRange(audio.StreamUsage.STREAM_USAGE_ALARM);
    
      logEnd('testAudioVolumeStream0007');
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_STREAM_0800
     * @tc.name      testAudioVolumeStream0008
     * @tc.desc      Verify every sampled stream usage exposes a legal volume range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeStream0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testAudioVolumeStream0008');
      for (let i = 0; i < USAGES.length; i++) {
        assertRange(USAGES[i]);
      }
    
      logEnd('testAudioVolumeStream0008');
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_STREAM_0900
     * @tc.name      testAudioVolumeStream0009
     * @tc.desc      Verify the media volume bounds stay stable across repeated queries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeStream0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testAudioVolumeStream0009');
      const volumeManager: audio.AudioVolumeManager = manager();
      const usage: audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MEDIA;
      const min: number = volumeManager.getMinVolumeByStream(usage);
      const max: number = volumeManager.getMaxVolumeByStream(usage);
      for (let i = 0; i < 20; i++) {
        expect(volumeManager.getMinVolumeByStream(usage)).assertEqual(min);
        expect(volumeManager.getMaxVolumeByStream(usage)).assertEqual(max);
      }
      expect(max - min).assertLargerOrEqual(0);
    
      logEnd('testAudioVolumeStream0009');
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_STREAM_1000
     * @tc.name      testAudioVolumeStream0010
     * @tc.desc      Verify the media and music aliases report identical volume bounds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeStream0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testAudioVolumeStream0010');
      const volumeManager: audio.AudioVolumeManager = manager();
      expect(volumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC))
        .assertEqual(volumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_MEDIA));
      expect(volumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC))
        .assertEqual(volumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_MEDIA));
    
      logEnd('testAudioVolumeStream0010');
    })
  });
}
