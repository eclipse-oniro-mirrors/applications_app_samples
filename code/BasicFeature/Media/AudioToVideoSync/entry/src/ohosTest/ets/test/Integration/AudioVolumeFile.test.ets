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
import {
  pathInFiles,
  readTextFile,
  removeQuietly,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

function optionsFor(usage: audio.StreamUsage): audio.AudioRendererOptions {
  const streamInfo: audio.AudioStreamInfo = {
    samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
    channels: audio.AudioChannel.CHANNEL_2,
    sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
    encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
  };
  const rendererInfo: audio.AudioRendererInfo = {
    usage: usage,
    rendererFlags: 0
  };
  return {
    streamInfo: streamInfo,
    rendererInfo: rendererInfo
  };
}

interface VolumeSnapshot {
  min: number;
  max: number;
  current: number;
  written: number;
  restored: string;
  parts: string[];
  preparedState: number;
  releasedState: number;
}

async function persistAndVerify(usage: audio.StreamUsage): Promise<VolumeSnapshot> {
  const manager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
  const min: number = manager.getMinVolumeByStream(usage);
  const max: number = manager.getMaxVolumeByStream(usage);
  const current: number = manager.getVolumeByStream(usage);
  const path: string = pathInFiles(uniqueName('avs_vol_file', '.txt'));
  const payload: string = `${min},${max},${current}`;
  let written: number = -1;
  let restored: string = '';
  let parts: string[] = [];
  try {
    written = writeTextFile(path, payload);
    restored = readTextFile(path, payload.length);
    parts = restored.split(',');
  } finally {
    removeQuietly(path);
  }
  const renderer: audio.AudioRenderer = await audio.createAudioRenderer(optionsFor(usage));
  const preparedState: number = renderer.state;
  await renderer.release();
  const releasedState: number = renderer.state;
  return {
    min: min,
    max: max,
    current: current,
    written: written,
    restored: restored,
    parts: parts,
    preparedState: preparedState,
    releasedState: releasedState
  };
}

export default function audioVolumeFileTest() {
  describe('audioVolumeFileTest', () => {
    beforeAll(() => {
      console.info('audioVolumeFileTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('audioVolumeFileTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_INTEGRATION_VOLUME_0100
     * @tc.name      testAudioVolumeFile0001
     * @tc.desc      Verify media volume bounds persist through a file round trip and the renderer prepares
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeFile0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const snapshot: VolumeSnapshot = await persistAndVerify(audio.StreamUsage.STREAM_USAGE_MEDIA);
      expect(snapshot.min).assertLargerOrEqual(0);
      expect(snapshot.max).assertLargerOrEqual(snapshot.min);
      expect(snapshot.current).assertLargerOrEqual(snapshot.min);
      expect(snapshot.current).assertLessOrEqual(snapshot.max);
      expect(snapshot.written).assertEqual(snapshot.restored.length);
      expect(snapshot.restored).assertEqual(`${snapshot.min},${snapshot.max},${snapshot.current}`);
      expect(snapshot.parts.length).assertEqual(3);
      expect(Number(snapshot.parts[0])).assertEqual(snapshot.min);
      expect(Number(snapshot.parts[1])).assertEqual(snapshot.max);
      expect(Number(snapshot.parts[2])).assertEqual(snapshot.current);
      expect(snapshot.preparedState).assertEqual(audio.AudioState.STATE_PREPARED);
      expect(snapshot.releasedState).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_VOLUME_0200
     * @tc.name      testAudioVolumeFile0002
     * @tc.desc      Verify movie volume bounds persist through a file round trip and the renderer prepares
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeFile0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const snapshot: VolumeSnapshot = await persistAndVerify(audio.StreamUsage.STREAM_USAGE_MOVIE);
      expect(snapshot.min).assertLargerOrEqual(0);
      expect(snapshot.max).assertLargerOrEqual(snapshot.min);
      expect(snapshot.current).assertLargerOrEqual(snapshot.min);
      expect(snapshot.current).assertLessOrEqual(snapshot.max);
      expect(snapshot.written).assertEqual(snapshot.restored.length);
      expect(snapshot.restored).assertEqual(`${snapshot.min},${snapshot.max},${snapshot.current}`);
      expect(snapshot.parts.length).assertEqual(3);
      expect(Number(snapshot.parts[0])).assertEqual(snapshot.min);
      expect(Number(snapshot.parts[1])).assertEqual(snapshot.max);
      expect(Number(snapshot.parts[2])).assertEqual(snapshot.current);
      expect(snapshot.preparedState).assertEqual(audio.AudioState.STATE_PREPARED);
      expect(snapshot.releasedState).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_VOLUME_0300
     * @tc.name      testAudioVolumeFile0003
     * @tc.desc      Verify game volume bounds persist through a file round trip and the renderer prepares
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeFile0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const snapshot: VolumeSnapshot = await persistAndVerify(audio.StreamUsage.STREAM_USAGE_GAME);
      expect(snapshot.min).assertLargerOrEqual(0);
      expect(snapshot.max).assertLargerOrEqual(snapshot.min);
      expect(snapshot.current).assertLargerOrEqual(snapshot.min);
      expect(snapshot.current).assertLessOrEqual(snapshot.max);
      expect(snapshot.written).assertEqual(snapshot.restored.length);
      expect(snapshot.restored).assertEqual(`${snapshot.min},${snapshot.max},${snapshot.current}`);
      expect(snapshot.parts.length).assertEqual(3);
      expect(Number(snapshot.parts[0])).assertEqual(snapshot.min);
      expect(Number(snapshot.parts[1])).assertEqual(snapshot.max);
      expect(Number(snapshot.parts[2])).assertEqual(snapshot.current);
      expect(snapshot.preparedState).assertEqual(audio.AudioState.STATE_PREPARED);
      expect(snapshot.releasedState).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_VOLUME_0400
     * @tc.name      testAudioVolumeFile0004
     * @tc.desc      Verify notification volume bounds persist through a file round trip and the renderer prepares
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeFile0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const snapshot: VolumeSnapshot = await persistAndVerify(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
      expect(snapshot.min).assertLargerOrEqual(0);
      expect(snapshot.max).assertLargerOrEqual(snapshot.min);
      expect(snapshot.current).assertLargerOrEqual(snapshot.min);
      expect(snapshot.current).assertLessOrEqual(snapshot.max);
      expect(snapshot.written).assertEqual(snapshot.restored.length);
      expect(snapshot.restored).assertEqual(`${snapshot.min},${snapshot.max},${snapshot.current}`);
      expect(snapshot.parts.length).assertEqual(3);
      expect(Number(snapshot.parts[0])).assertEqual(snapshot.min);
      expect(Number(snapshot.parts[1])).assertEqual(snapshot.max);
      expect(Number(snapshot.parts[2])).assertEqual(snapshot.current);
      expect(snapshot.preparedState).assertEqual(audio.AudioState.STATE_PREPARED);
      expect(snapshot.releasedState).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_INTEGRATION_VOLUME_0500
     * @tc.name      testAudioVolumeFile0005
     * @tc.desc      Verify the volume snapshot for every sampled usage keeps the min to max ordering
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolumeFile0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const usages: audio.StreamUsage[] = [
        audio.StreamUsage.STREAM_USAGE_MEDIA,
        audio.StreamUsage.STREAM_USAGE_MOVIE,
        audio.StreamUsage.STREAM_USAGE_GAME,
        audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        audio.StreamUsage.STREAM_USAGE_RINGTONE,
        audio.StreamUsage.STREAM_USAGE_ALARM
      ];
      const manager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
      for (let i = 0; i < usages.length; i++) {
        const min: number = manager.getMinVolumeByStream(usages[i]);
        const max: number = manager.getMaxVolumeByStream(usages[i]);
        expect(max).assertLargerOrEqual(min);
        expect(min).assertLargerOrEqual(0);
        expect(max).assertLessOrEqual(10000);
      }
    })
  });
}
